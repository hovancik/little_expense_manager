import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'error', 'success', 'form' ]

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
      if (json.redirectUrl) {
        window.location.href = json.redirectUrl
      } else {
        setTimeout(()=> this.successTarget.textContent = "", 2000)
        this.successTarget.textContent = "Saved!"
      }
    } else {
      this.errorTarget.textContent = json.errors
    }
  }

}
