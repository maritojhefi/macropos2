<template>
  <div>
    <!-- breadcrumbs Start -->
    <breadcrumbs :items="breadcrumbs" :current="breadcrumbsCurrent" />
    <!-- breadcrumbs end -->
    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">
              {{ $t('cashbook.transfers.create.form_title') }}
            </h3>
            <router-link
              :to="{ name: 'transferBalances.index' }"
              class="btn btn-dark float-right"
            >
              <i class="fas fa-long-arrow-alt-left" /> {{ $t('common.back') }}
            </router-link>
          </div>
          <!-- /.card-header -->
          <!-- form start -->
          <form
            role="form"
            @submit.prevent="saveTransfer"
            @keydown="form.onKeydown($event)"
          >
            <div class="card-body">
              <!-- 1. Motivo de transferencia -->
              <div class="row">
                <div class="form-group col-md-12">
                  <label for="transferReason">
                    {{ $t('cashbook.common.transfer_reason') }}
                    <span class="required">*</span>
                  </label>
                  <input
                    type="text"
                    id="transferReason"
                    v-model="form.transferReason"
                    class="form-control"
                    :class="{ 'is-invalid': form.errors.has('transferReason') }"
                    :placeholder="$t('common.return_reason_placeholder')"
                    name="transferReason"
                  />
                  <has-error :form="form" field="transferReason" />
                </div>
              </div>

              <!-- 2. Selección de cuentas origen y destino -->
              <div class="row" v-if="items">
                <div class="form-group col-md-6">
                  <label for="fromAccount">
                    {{ $t('cashbook.common.from_account') }}
                    <span class="required">*</span>
                  </label>
                  <v-select
                    v-model="form.fromAccount"
                    :options="items"
                    label="label"
                    :class="{ 'is-invalid': form.errors.has('fromAccount') }"
                    name="fromAccount"
                    :placeholder="$t('common.account_placeholder')"
                    @input="onFromAccountChange"
                  />
                  <has-error :form="form" field="fromAccount" />
                </div>
                <div class="form-group col-md-6">
                  <label for="toAccount">
                    {{ $t('cashbook.common.to_account') }}
                    <span class="required">*</span>
                  </label>
                  <v-select
                    v-model="form.toAccount"
                    :options="items"
                    label="label"
                    :class="{ 'is-invalid': form.errors.has('toAccount') }"
                    name="toAccount"
                    :placeholder="$t('common.account_placeholder')"
                    @input="onToAccountChange"
                  />
                  <has-error :form="form" field="toAccount" />
                </div>
              </div>

              <!-- 3. Montos y cálculo de tasa -->
              <div class="row" v-if="form.fromAccount && form.toAccount">
                <!-- 3.1 Saldo disponible (origen) -->
                <div class="form-group col-md-3">
                  <label for="availableBalance">
                    {{ $t('common.available_balance') }}
                  </label>
                  <input
                    id="availableBalance"
                    v-model="form.availableBalance"
                    type="number"
                    step="any"
                    class="form-control"
                    :class="{ 'is-invalid': form.errors.has('availableBalance') }"
                    name="availableBalance"
                    readonly
                  />
                  <has-error :form="form" field="availableBalance" />
                </div>

                <!-- 3.2 Monto a retirar -->
                <div class="form-group col-md-3">
                  <label for="amount">
                    {{ $t('common.amount') }}
                    <span class="required">*</span>
                  </label>
                  <input
                    id="amount"
                    v-model.number="form.amount"
                    type="number"
                    step="any"
                    class="form-control"
                    :class="{ 'is-invalid': form.errors.has('amount') }"
                    name="amount"
                    placeholder="Ingresa un monto"
                  />
                  <has-error :form="form" field="amount" />
                </div>

                <!-- 3.3 Monto que recibe destino -->
                <div class="form-group col-md-3">
                  <label for="receivedAmount">
                    {{
                      $t('cashbook.transfers.create.received_amount') ||
                      'Monto recibido'
                    }}
                    <span class="required">*</span>
                  </label>
                  <input
                    id="receivedAmount"
                    v-model.number="form.receivedAmount"
                    type="number"
                    step="any"
                    class="form-control"
                    :class="{ 'is-invalid': form.errors.has('receivedAmount') }"
                    name="receivedAmount"
                    placeholder="Monto destino"
                  />
                  <has-error :form="form" field="receivedAmount" />
                </div>

                <!-- 3.4 Tasa de cambio (readonly) -->
                <div class="form-group col-md-3">
                  <label for="exchangeRate">
                    {{ $t('cashbook.transfers.create.exchange_rate') ||
                      'Tasa de cambio' }}
                  </label>
                  <input
                    id="exchangeRate"
                    v-model="form.exchangeRate"
                    type="number"
                    step="any"
                    class="form-control"
                    readonly
                    name="exchangeRate"
                    placeholder="–"
                  />
                </div>
              </div>

              <!-- 4. Fecha y estado -->
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="date">{{ $t('common.date') }}</label>
                  <input
                    id="date"
                    v-model="form.date"
                    type="date"
                    class="form-control"
                    :class="{ 'is-invalid': form.errors.has('date') }"
                    name="date"
                  />
                  <has-error :form="form" field="date" />
                </div>
                <div class="form-group col-md-6">
                  <label for="status">{{ $t('common.status') }}</label>
                  <select
                    id="status"
                    v-model="form.status"
                    class="form-control"
                    :class="{ 'is-invalid': form.errors.has('status') }"
                    name="status"
                  >
                    <option value="1">{{ $t('common.active') }}</option>
                    <option value="0">{{ $t('common.in_active') }}</option>
                  </select>
                  <has-error :form="form" field="status" />
                </div>
              </div>

              <!-- 5. Nota -->
              <div class="form-group">
                <label for="note">{{ $t('common.note') }}</label>
                <textarea
                  id="note"
                  v-model="form.note"
                  class="form-control"
                  :class="{ 'is-invalid': form.errors.has('note') }"
                  :placeholder="$t('common.note_placeholder')"
                  name="note"
                ></textarea>
                <has-error :form="form" field="note" />
              </div>
            </div>
            <!-- /.card-body -->

            <!-- Botones -->
            <div class="card-footer">
              <v-button :loading="form.busy" class="btn btn-primary">
                <i class="fas fa-save" /> {{ $t('common.save') }}
              </v-button>
              <button
                type="reset"
                class="btn btn-secondary float-right"
                @click="form.reset()"
              >
                <i class="fas fa-power-off" /> {{ $t('common.reset') }}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Form from 'vform'
import { mapGetters } from 'vuex'

export default {
  middleware: ['auth', 'check-permissions'],
  metaInfo() {
    return { title: this.$t('cashbook.transfers.create.page_title') }
  },
  data: () => ({
    breadcrumbsCurrent: 'cashbook.transfers.create.breadcrumbs_current',
    breadcrumbs: [
      {
        name: 'cashbook.transfers.create.breadcrumbs_first',
        url: 'home',
      },
      {
        name: 'cashbook.transfers.create.breadcrumbs_second',
        url: '',
      },
      {
        name: 'cashbook.transfers.create.breadcrumbs_third',
        url: 'transferBalances.index',
      },
      {
        name: 'cashbook.transfers.create.breadcrumbs_active',
        url: '',
      },
    ],
    form: new Form({
      fromAccount: null,
      toAccount: null,
      transferReason: '',
      availableBalance: 0,
      amount: '',             // monto que se retira
      receivedAmount: '',     // monto que recibe la cuenta destino
      exchangeRate: 0,        // tasa de cambio (readonly)
      date: new Date().toISOString().slice(0, 10),
      note: '',
      status: 1,
    }),
    loading: true,
  }),
  computed: {
    ...mapGetters('operations', ['items', 'appInfo']),
  },
  created() {
    this.getAccounts()
  },
  watch: {
    // Cada vez que cambie el monto retirado o recibido, recalcular la tasa
    'form.amount'(newVal) {
      this.computeExchangeRate()
    },
    'form.receivedAmount'(newVal) {
      this.computeExchangeRate()
    },
  },
  methods: {
    // 1. Obtener todas las cuentas
    async getAccounts() {
      await this.$store.dispatch('operations/allData', {
        path: '/api/all-accounts',
      })
      // asignar cuenta por defecto (si existe)
      if (this.items && this.items.length > 0) {
        let defaultAccountSlug = this.appInfo.defaultAccountSlug
        this.form.fromAccount = this.items.find(
          (account) => account.slug === defaultAccountSlug
        )
        this.onFromAccountChange()
      }
    },

    // 2. Cuando cambia la cuenta origen
    onFromAccountChange() {
      if (this.form.fromAccount) {
        this.form.availableBalance = this.form.fromAccount.availableBalance
      } else {
        this.form.availableBalance = 0
      }
      // Limpio monto y tasa cuando cambio cuenta origen
      this.form.amount = ''
      this.form.receivedAmount = ''
      this.form.exchangeRate = 0
    },

    // 3. Cuando cambia la cuenta destino (puede servir si quieres lógica adicional)
    onToAccountChange() {
      // por ahora no hacemos nada extra, pero queda el hook para validaciones futuras
    },

    // 4. Calcular la tasa de cambio automáticamente
    computeExchangeRate() {
      const amt = parseFloat(this.form.amount) || 0
      const rec = parseFloat(this.form.receivedAmount) || 0
      if (amt > 0 && rec > 0) {
        this.form.exchangeRate = parseFloat((rec / amt).toFixed(6))
      } else {
        this.form.exchangeRate = 0
      }
    },

    // 5. Enviar formulario
    async saveTransfer() {
      // Antes de enviar, podrías validar que receivedAmount y amount no sean iguales a 0
      await this.form
        .post(window.location.origin + '/api/balance-transfers', {
          // Nota: vform enviará automáticamente todos los campos de `form`
          // a menos que uses `this.form.post(url, { campo1: 'valor1', ... })`
        })
        .then(() => {
          toast.fire({
            type: 'success',
            title: this.$t('cashbook.transfers.create.success_msg'),
          })
          this.$router.push({ name: 'transferBalances.index' })
        })
        .catch(() => {
          toast.fire({ type: 'error', title: this.$t('common.error_msg') })
        })
    },
  },
}
</script>

<style lang="scss" scoped>
/* Si necesitases estilos adicionales, agrégalos aquí */
</style>
