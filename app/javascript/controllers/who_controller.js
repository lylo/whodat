import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slide"]
  static values = { index: Number }

  initialize() {
    this.showCurrentSlide()
  }

  next() {
    if (this.indexValue < this.slideTargets.length - 1) {
      this.indexValue++
      this.showCurrentSlide()
    } else {
      location.reload()
    }
  }

  showCurrentSlide() {
    this.slideTargets.forEach((element, ) => {
      if (this.indexValue < 2) {
        element.hidden = element.dataset.index != this.indexValue
      } else if (this.indexValue == 2) {
        element.hidden = element.dataset.index == 0 || element.dataset.index == 3
      } else {
        element.hidden = element.dataset.index == 0 || element.dataset.index == 1
      }
    })
  }
}