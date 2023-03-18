import { Controller } from "@hotwired/stimulus"
import { clippingParents } from "@popperjs/core"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["map", "form", "input", 'content']
  connect() {
    console.log("hello from search controller")
    console.log(this.mapTarget)
    console.log(this.formTarget)
    console.log(this.inputTarget)
  }

  update() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`;
    fetch(url, {
      headers: { "Accept": 'application/json' }
    })
    .then(response => response.json())
    .then((data) => {
      // this.resultsTarget.outerHTML = data.results
      this.mapTarget.dataset.mapMarkersValue = JSON.stringify(data.markers)
    })
  }
}
