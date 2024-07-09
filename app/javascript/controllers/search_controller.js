import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ 'form', 'input' ]
  connect() {
   
  }

  update(event) {
    const turboFrame = document.getElementById('content');
    const query = this.inputTarget.value;
    const url = `${this.formTarget.action}?query=${query}`

    if (query.trim() === "") {
      window.location.href = "/"
    } else {
      turboFrame.src = url;
    }
 
  }
}
