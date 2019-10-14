import Vue from 'vue/dist/vue.esm'
import axios from 'axios'

var Account = {
  data: {
    accountId: 0,
    accountInfo: {}
  },
  mounted: function() {
    this.getAccount()
  },
  methods: {
    getAccount: function() {
      axios.get(`/data_management/accounts/` + this.accountId + `.json`)
        .then(res => {
          this.setAccountInfo(res.data)
        })
    },
    setAccountInfo(data) {
      this.accountInfo = data
    }
  },
  watch: {
    accountId: function(val, oldVal) {
      this.getAccount()
    }
  }
}

new Vue({
  el: '.new_history, .edit_history',
  mixins: [Account],
  data: {
    selectedAccountId: '',
    useName: ''
  },
  created: function() {
    this.initialize()
  },
  methods: {
    initialize: function() {
      this.accountId = this.selectedAccountId = this.getAccountId()
    },
    getAccountId: function() {
      return document.getElementById('history_account_id').value
    }
  },
  watch: {
    selectedAccountId: function(val, oldVal) {
      this.accountId = val
    },
    accountInfo: function(val, oldVal) {
      this.useName = val.use.name
    }
  }
})
