import { Controller } from 'stimulus'
import Chartkick from 'chartkick'
import Chart from 'chart.js'

Chartkick.addAdapter(Chart)

export default class extends Controller {
  connect () {
    this.chart()
  }

  chart () {
    let data = JSON.parse(this.data.get('chartData'))
    let ctx = this.data.get('containerId')
    new Chartkick.PieChart(ctx, data)
  }
}
