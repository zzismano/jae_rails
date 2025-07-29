import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("TEST CONTROLLER CONNECTED!")
    alert("Test controller is working!")
  }
} 