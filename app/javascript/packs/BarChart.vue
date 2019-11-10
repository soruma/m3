import Vue from 'vue'
import { Bar } from 'vue-chartjs'

Vue.component('bar-chart', {
  extends: Bar,
  props: {
    chartdata: {
      type: Object,
      default: null
    },
    options: {
      type: Object,
      default: null
    }
  },
  mounted: function() {
    this.renderChart(this.chartdata, this.options)
  }
})
