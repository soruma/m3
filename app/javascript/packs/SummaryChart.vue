import Vue from 'vue'
import BarChart from './BarChart.vue'

export default {
  name: 'SummaryChart',
  components: {
    BarChart
  },
  data: function () {
    return {
      loaded: false,
      chartdata: null,
      options: null
    }
  },
  mounted: async function() {
    this.loaded = false
    try {
      this.chartdata = {
        labels: ['2019/1', '2019/2', '2019/3', '2019/4'],
        datasets: [
          {
            label: 'Wallet',
            backgroundColor: '#faaf08',
            data: [40, 50, 0, 10]
          },
          {
            label: 'Wild rose bank',
            backgroundColor: '#fa812f',
            data: [40, 50, 30]
          },
          {
            label: 'Yambaru credit card',
            backgroundColor: '#fa4032',
            data: [40, 50, 30]
          },
          {
            label: 'Cash stash',
            backgroundColor: '#fef3e2',
            data: [40, 50, 30]
          },
          {
            label: 'Zerland bank',
            backgroundColor: '#c7db00',
            data: [40, 50, 30]
          },
          {
            label: 'Developing nation index fund',
            backgroundColor: '#7aa802',
            data: [40, 50, 30]
          },
          {
            label: 'Advanced nation index fund',
            backgroundColor: '#f78b2d',
            data: [40, 50, 0, 20, 100]
          },
          {
            label: 'Dividend emphasize fund',
            backgroundColor: '#e4b600',
            data: [40, 50, 30, 0, 30]
          }
        ]
      }
      this.options = {
        maintainAspectRatio: false,
        scales: {
          xAxes: [{
            stacked: true
          }],
          yAxes: [{
            stacked: true
          }]
        }
      }
      this.loaded = true
    } catch(e) {
      console.error(e)
    }
  }
}
