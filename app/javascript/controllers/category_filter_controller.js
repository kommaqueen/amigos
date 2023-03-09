import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category-filter"
export default class extends Controller {
  static targets = ["filterContainer", "button"]
  static values = {url: String}

  // connect() {
  //   console.log("hi! from category filter");
  // }

  filter(event) {
    // fetch()
    console.log(this.urlValue);
    console.log(event.target.innerText);
    const url = `${this.urlValue}?category=${event.target.innerText}`;
    console.log(event);
    this.buttonTargets.forEach(button => button.classList.remove("pushed"))
    event.target.classList.add("pushed");
    fetch(url, {
      method: 'GET',
      headers: {
          'Accept': 'application/json',
      },
    })
    .then(response => response.json())
    .then(data => {
      this.filterContainerTarget.outerHTML = data.content
    })
  }
}
