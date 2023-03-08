import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="check-in"
export default class extends Controller {
  static targets = ["pill", "form"]

  connect() {
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  }

  send(event) {
    event.preventDefault()
    const url = this.formTarget.action
    const options = {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken },
      body: new FormData(this.formTarget)
    }
    fetch(url, options)
    .then(response => response.json())
    .then((data) => {
      console.log(data)
    })
  }
}
