import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selector"
export default class extends Controller {

  static targets = ["subcategory"]


  connect() {
    console.log();
  }



  filter(event) {

    const clickedElement = event.currentTarget


    const siblings =[...clickedElement.parentElement.children].filter(c => c !== clickedElement);
    siblings.forEach(sibling => sibling.classList.remove("text-decoration-underline-thick"));
    clickedElement.classList.add("text-decoration-underline-thick");



    // Log the sibling elements


    // Example: Add a class to the clicked element (optional)
    // event.currentTarget.classList.add("text-decoration-underline");
  }
}
