import { Controller } from 'stimulus'

export default class extends Controller {
  connect () {
    this.open()
  }

  open () {
    this.element.classList.add('is-active')
  }

  close () {
    this.element.classList.remove('is-active')
    this.element.parentNode.removeChild(this.element)
  }
}
