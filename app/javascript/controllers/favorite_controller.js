import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = ["link"]


  connect() {

    console.log(this.linkTarget)


  }

  toggled(event) {
    event.preventDefault()
    event.currentTarget.classList.toggle("fas")
    event.currentTarget.classList.toggle("far")
    fetch(this.linkTarget.href)
  }

}
