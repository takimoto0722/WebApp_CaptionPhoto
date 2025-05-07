import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = ["panel", "icon"]

  toggle() {
    this.panelTarget.classList.toggle("open")
    this.iconTarget.classList.toggle("active")
  }
}
