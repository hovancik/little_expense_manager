import { Controller } from 'stimulus'
import Noty from 'noty'
import Chartkick from 'chartkick'
import 'chart.js'

Chartkick.use(Chart)

export default class extends Controller {
  static targets = ['error', 'submit']

  connect() {
  }

  async submit (event = null) {
    if (event) {
      event.preventDefault()
    }
    this.submitTarget.disabled = true
    this.submitTarget.classList.add('is-loading')
    let form = this.element
    let body = new FormData(form)
    let action = form.action
    let refreshUrl = this.data.get('refreshurl')
    let refresh = this.data.get('refresh')
    let result = await fetch(action, {
      credentials: 'same-origin',
      method: 'POST',
      body: body
    })
    let json = await result.json()
    if (result.ok) {
      this.errorTarget.classList.add('is-hidden')
      if (json.redirectUrl) {
        window.location.href = json.redirectUrl
        return
      } else if (refreshUrl) {
        let refreshResult = await fetch(refreshUrl)
        let html = await refreshResult.text()
        if (refreshResult.ok) {
          const refreshElement =  document.querySelector(`#${refresh}`)
          refreshElement.innerHTML = html
          this.notify()
          // we eval Chartkick's script as it is not run when changing innerHTML
          const scripts = refreshElement.getElementsByTagName('script');
          for(let i=0; i < scripts.length; i++) {
            eval(scripts[i].innerHTML)
          }
        }
      }
    } else {
      this.errorTarget.classList.remove('is-hidden')
      this.errorTarget.textContent = json.errors
    }
    this.submitTarget.disabled = false
    this.submitTarget.classList.remove('is-loading')
  }

  notify () {
    new Noty({
      callbacks: {
        onTemplate: function() {
          this.barDom.innerHTML = '<div class="notification is-' + this.options.type +' noty_body">' + this.options.text + '<div>'
          // Important: .noty_body class is required for setText API method.
        }
      },
      type: 'link',
      text: 'All done :)',
      timeout: 3500
    }).show()
  }

}
