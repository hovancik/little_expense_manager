import { Controller } from 'stimulus'

export default class extends Controller {
  async open (event) {
    event.preventDefault()
    this.element.innerHTML += `
      <div class="modal" data-controller="modal">
        <div class="modal-background"></div>
        <div class="modal-content">
        </div>
        <button class="modal-close is-large" aria-label="close" data-action="modal#close"></button>
      </div>
    `
    let result = await fetch(this.data.get('url'), {
      credentials: 'same-origin',
      method: 'GET'
    })
    let text = await result.text()
    if (result.ok) {
      document.querySelector('.modal-content').innerHTML = text
    }
  }
}
