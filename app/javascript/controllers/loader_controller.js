import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'form' ]

  connect () {
    this.submit()
  }

  async submit (event = null) {
    if (event) {
      event.preventDefault()
    }
    let containerId = this.data.get('containerId')
    document.querySelector(`#${containerId}`).innerHTML = this._spinner
    let form = this.formTarget
    let body = new FormData(form)
    let action = form.action
    let method = form.method
    let result = await fetch(action, {
      credentials: 'same-origin',
      method: method,
      body: body
    })
    let text = await result.text()
    if (result.ok) {
      document.querySelector(`#${containerId}`).innerHTML = text
    }
  }

  get _spinner () {
    return '<div class="fa-3x has-text-centered"><i class="fas fa-spinner fa-pulse"></i></div>'
  }
}
