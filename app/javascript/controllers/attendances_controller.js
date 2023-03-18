import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="attendances"
export default class extends Controller {
  static targets = ["form", "attendees"]
  connect() {
    console.log('hello from attendances controller')
    console.log(this.formTarget)
    console.log(this.attendeesTarget)
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
      this.attendeesTarget.outerHTML = data.public_attendees
      this.formTarget.outerHTML = data.my_form
    })
  }
}
