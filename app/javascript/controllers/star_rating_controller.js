import { Controller } from "@hotwired/stimulus"
import StarRating from "star-rating.js"

// Connects to data-controller="star-rating"
export default class extends Controller {
  connect() {
    new StarRating(this.element, {
      classNames: {
          active: 'gl-active',
          base: 'gl-star-rating',
          selected: 'gl-selected',
      },
      clearable: true,
      maxStars: 10,
      prebuilt: false,
      stars: null,
      tooltip: false
  })
  }
}
