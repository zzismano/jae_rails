import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="header"
export default class extends Controller {
  connect() {
    // console.log('Hello from Header!')
  }

  searchWhereWhen(event) {
    const url = event.target.value;
    const turboFrame = document.getElementById('content');
    turboFrame.src = url;
  }
}
