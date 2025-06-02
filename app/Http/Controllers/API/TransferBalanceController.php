<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\BalanceTranasferResource;
use App\Models\AccountTransaction;
use App\Models\BalanceTansfer;
use Exception;
use Illuminate\Http\Request;

class TransferBalanceController extends Controller
{
    // define middleware
    public function __construct()
    {
        $this->middleware('can:account-transfer-balance-list', ['only' => ['index', 'search']]);
        $this->middleware('can:account-transfer-balance-create', ['only' => ['create']]);
        $this->middleware('can:account-transfer-balance-view', ['only' => ['show']]);
        $this->middleware('can:account-transfer-balance-edit', ['only' => ['update']]);
        $this->middleware('can:account-transfer-balance-delete', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        return BalanceTranasferResource::collection(BalanceTansfer::with('debitTransaction.cashbookAccount', 'creditTransaction.cashbookAccount', 'user')->latest()->paginate($request->perPage));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // validate request
        $this->validate($request, [
            'transferReason' => 'required|string|max:255',
            'fromAccount' => 'required',
            'toAccount' => 'required|different:fromAccount',
            'amount' => 'required|numeric|min:1|max:' . $request->availableBalance,
            'receivedAmount'   => 'required|numeric|min:1',
            'date' => 'nullable|date_format:Y-m-d',
            'note' => 'nullable|string|max:255',
        ]);

        try {
            // get logged in user id
            $userId = auth()->user()->id;

            // 2. Extraigo los valores del request
            $fromAccountData   = $request->fromAccount;   // es un array con 'id', 'accountNumber', etc.
            $toAccountData     = $request->toAccount;     // idem
            $amount            = floatval($request->amount);
            $receivedAmount    = floatval($request->receivedAmount);
            $exchangeRate      = ($amount > 0)
                ? round($receivedAmount / $amount, 6)
                : 0;
            // 3. Transacción de débito en cuenta origen
            $debitReason = "Transferencia desde: [{$fromAccountData['accountNumber']}]";
            $debitTransaction = AccountTransaction::create([
                'account_id'       => $fromAccountData['id'],
                'amount'           => $amount,                   // se debita el valor "original"
                'reason'           => $debitReason,
                'type'             => 0,                         // 0 = débito
                'transaction_date' => $request->date,
                'created_by'       => $userId,
                'status'           => $request->status,
            ]);

            // 4. Transacción de crédito en cuenta destino
            $creditReason = "Transferencia balance destino [{$toAccountData['accountNumber']}]";
            $creditTransaction = AccountTransaction::create([
                'account_id'       => $toAccountData['id'],
                'amount'           => $receivedAmount,           // se acredita el valor recibido
                'reason'           => $creditReason,
                'type'             => 1,                         // 1 = crédito
                'transaction_date' => $request->date,
                'created_by'       => $userId,
                'status'           => $request->status,
            ]);


            $transferData = [
                'reason'         => $request->transferReason,
                'debit_id'       => $debitTransaction->id,
                'credit_id'      => $creditTransaction->id,
                'amount'         => $amount,            // monto original
                'date'           => $request->date,
                'note'           => clean($request->note),
                'status'         => $request->status,
                'created_by'     => $userId,
                'exchange_rate'  => $exchangeRate,      // tasa de cambio calculada
                'received_amount' => $receivedAmount, // monto recibido
            ];

            BalanceTansfer::create($transferData);

            return $this->responseWithSuccess('Transferencia creada exitosamente');
        } catch (Exception $e) {
            return $this->responseWithError($e->getMessage());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        try {
            $transfer = BalanceTansfer::with('debitTransaction', 'creditTransaction', 'user')->where('slug', $slug)->first();

            return new BalanceTranasferResource($transfer);
        } catch (Exception $e) {
            return $this->responseWithError($e->getMessage());
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $slug)
    {
        $transfer = BalanceTansfer::with('debitTransaction', 'creditTransaction', 'user')->where('slug', $slug)->first();
        // validate request
        $this->validate($request, [
            'transferReason' => 'required|string|max:255',
            'fromAccount' => 'required',
            'amount' => 'required|numeric|min:1|max:' . $request->availableBalance,
            'date' => 'nullable|date_format:Y-m-d',
            'note' => 'nullable|string|max:255',
        ]);

        try {
            // update debit transaction
            $transfer->debitTransaction->update([
                'account_id' => $request->fromAccount['id'],
                'amount' => $request->amount,
                'transaction_date' => $request->date,
                'status' => $request->status,
            ]);

            // update debit transaction
            $transfer->creditTransaction->update([
                'amount' => $request->amount,
                'transaction_date' => $request->date,
                'status' => $request->status,
            ]);

            // update transfer
            $transfer->update([
                'reason' => $request->transferReason,
                'amount' => $request->amount,
                'date' => $request->date,
                'note' => clean($request->note),
                'status' => $request->status,
            ]);

            return $this->responseWithSuccess('Transfer updated successfully');
        } catch (Exception $e) {
            return $this->responseWithError($e->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($slug)
    {
        try {
            $transfer = BalanceTansfer::where('slug', $slug)->first();

            // check if the transfer can be delete
            $canDelete = true;
            if ($transfer->creditTransaction->cashbookAccount->availableBalance() < $transfer->amount) {
                $canDelete = false;
            }

            if ($canDelete) {
                // delete transfer transactions
                $transfer->debitTransaction->delete();
                $transfer->creditTransaction->delete();
                $transfer->delete();
            } else {
                return $this->responseWithError('Sorry you can\'t delete this transfer!');
            }

            return $this->responseWithSuccess('Transfer deleted successfully');
        } catch (Exception $e) {
            return $this->responseWithError($e->getMessage());
        }
    }

    /**
     * search resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Resources\Json\AnonymousResourceCollection
     */
    public function search(Request $request)
    {
        $term = $request->term;
        $query = BalanceTansfer::with('debitTransaction.cashbookAccount', 'creditTransaction.cashbookAccount', 'user');

        if ($request->startDate && $request->endDate) {
            $query = $query->whereBetween('date', [$request->startDate, $request->endDate]);
        }

        $query->where(function ($query) use ($term) {
            $query->where('reason', 'LIKE', '%' . $term . '%')
                ->orWhere('amount', 'LIKE', '%' . $term . '%')
                ->orWhereHas('debitTransaction', function ($newQuery) use ($term) {
                    $newQuery->whereHas('cashbookAccount', function ($newQuery) use ($term) {
                        $newQuery->where('account_number', 'LIKE', '%' . $term . '%')
                            ->orWhere('bank_name', 'LIKE', '%' . $term . '%');
                    });
                })
                ->orWhereHas('creditTransaction', function ($newQuery) use ($term) {
                    $newQuery->whereHas('cashbookAccount', function ($newQuery) use ($term) {
                        $newQuery->where('account_number', 'LIKE', '%' . $term . '%')
                            ->orWhere('bank_name', 'LIKE', '%' . $term . '%');
                    });
                });
        });

        return BalanceTranasferResource::collection($query->latest()->paginate($request->perPage));
    }
}
