import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      mode: "multiple", // or other options as needed
      dateFormat: "Y-m-d", // or other format
      allowInput: true,
    });
  }
}
