import { Controller } from 'stimulus'

export default class extends Controller {
  async open (event) {
    event.preventDefault()
    this.element.innerHTML += `
      <div class="modal" data-controller="modal">
      </div>
    `
    const result = await fetch(this.data.get('url'), {
      credentials: 'same-origin',
      method: 'GET'
    })
    const text = await result.text()
    if (result.ok) {
      document.querySelector('.modal').innerHTML = text
    }
  }
}
