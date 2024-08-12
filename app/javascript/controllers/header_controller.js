import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="header"
export default class extends Controller {
  static values = {
    route: String
  }
  connect() {
    // console.log('Hello from Header!')
  }

  searchWhere(event) {

    let url = event.target.value;

    // limpa params anteriores
    if (url.match(/\?where=[a-z]+_[a-z]+\?where=/)) {
      const new_url = url.replace(/^.*(?=\?where=[a-z]+)/, '');
      const base = url.match(/\/[a-z]+/)[0];
      url = `${base}${new_url}`;
    }
    
    const turboFrame = document.getElementById('content');
    turboFrame.src = url;
    
  }

  searchWhen(event) {
    console.log('Hello World!');
    
    let url = event.target.value;

    if (url.match(/\?when=[a-z]+\?when=[a-z]+/)) {
      
      const new_url = url.replace(/^.*(?=\?when=[a-z]+)/, '');
      const base = url.match(/\/[a-z]+/)[0];
      url = `${base}${new_url}`;
    }
    
    const turboFrame = document.getElementById('content');
    turboFrame.src = url;
    event.target.value = '';
    
  }
}
