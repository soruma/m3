import Vue from 'vue'
import SummaryChart from './SummaryChart.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(SummaryChart)
  }).$mount()
  document.getElementById('chart').appendChild(app.$el)
})
