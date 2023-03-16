import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

// Connects to data-controller="tom-select"
export default class extends Controller {
  static values = { options: Object }

  connect() {
    const tom =new TomSelect(
      this.element,
      this.optionsValue)
      tom.settings.placeholder = "Search for a user";
      tom.inputState();
    console.log('Hello from tom select')
  }
}
