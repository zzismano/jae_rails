import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ 'form', 'input' ]
  connect() {
   
  }

  update(event) {
    const turboFrame = document.getElementById('content');
    
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`

    fetch(url, { headers: { "Accept": 'text/plain' } })
    .then(response => response.text())
    .then((data) => {
      
    turboFrame.src = url;
    })
  }
}
