import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'error', 'form' ]

  connect () {
  }

  async submit (event) {
    event.preventDefault()
    let form = this.formTarget
    let body = new FormData(form)
    let action = form.action
    let result = await fetch(action, {
      credentials: 'same-origin',
      method: 'POST',
      body: body
    })
    let json = await result.json()
    if (result.ok) {
      window.location.href = json.redirectUrl
    } else {
      this.errorTarget.textContent = json.errors
    }
  }

}
