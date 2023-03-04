import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = [ "box", "icon" ]

  connect() {
    console.log("Hello!")
  }

  handleClick(event) {
    const icon = event.currentTarget
    const id = icon.dataset.opens
    const box = this.boxTargets.find(box => box.id == id)
    // make sure that everything is rest -> All icons innactive, All boxes with d-non
    if (icon.classList.contains("active")) {
      this.resetSate()
    } else {
      this.resetSate()
      icon.classList.add("active")
      box.classList.remove("d-none")
    }
  }

  resetSate() {
    this.boxTargets.forEach(box => box.classList.add("d-none"))
    this.iconTargets.forEach(box => box.classList.remove("active"))
  }

}
