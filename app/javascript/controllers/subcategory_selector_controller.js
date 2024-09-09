import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selector"
export default class extends Controller {

  static targets = ["subcategory"]


  connect() {

  }



  filter(event) {

    console.log("yo");
    const clickedElement = event.currentTarget
    console.log(clickedElement);

    const siblings =[...clickedElement.parentElement.children].filter(c => c !== clickedElement);
    siblings.forEach(sibling => sibling.classList.remove("text-decoration-underline-thick"));
    clickedElement.classList.add("text-decoration-underline-thick");


    console.log( clickedElement.classList);


    // Log the sibling elements


    // Example: Add a class to the clicked element (optional)
    // event.currentTarget.classList.add("text-decoration-underline");
  }

  clear(event) {
    const allSubcategories = document.querySelectorAll("[data-subcategory-selector-target='subcategory']");

    allSubcategories.forEach(subcategory => {
      subcategory.classList.remove("text-decoration-underline-thick");

    });



  }
}
