import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="header"
export default class extends Controller {
  static values = {
    route: String
  }
  connect() {
    // console.log('Hello from Header!')
  }

  searchWhereWhen(event) {
    const url = event.target.value;
    console.log(url);
    const turboFrame = document.getElementById('content');
    turboFrame.src = url;
  }
}
