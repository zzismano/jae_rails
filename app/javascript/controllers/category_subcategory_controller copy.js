// app/javascript/controllers/category_subcategory_controller.js
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category-subcategory"
export default class extends Controller {
  static targets = ["subcategory"]

  update(event) {
    const categoryId = event.target.value;
    if (categoryId) {
      fetch(`/subcategories?category_id=${categoryId}`)
        .then(response => response.json())
        .then(data => {
          if (Array.isArray(data)) {
            this.updateSubcategorySelect(data);
          } else {
            console.error('Invalid subcategories data format');
            this.clearSubcategorySelect();
          }
        })
        .catch(error => {
          console.error('Error fetching subcategories:', error);
          this.clearSubcategorySelect();
        });
    } else {
      this.clearSubcategorySelect();
    }
  }

  updateSubcategorySelect(subcategories) {
  const subcategorySelect = this.subcategoryTarget;
  if (!subcategorySelect) {
    console.error('Subcategory select target not found');
    return;
  }

  subcategorySelect.innerHTML = ""; // Clear existing options

  const promptOption = document.createElement("option");
  promptOption.value = "";
  promptOption.textContent = "Escolha uma subcategoria:";
  subcategorySelect.appendChild(promptOption);

  subcategories.forEach(subcategory => {
    const option = document.createElement("option");
    option.value = subcategory.id;
    option.textContent = subcategory.name;

    // Check if this subcategory should be selected
    if (subcategory.id == this.element.dataset.subcategoryId) {
      option.selected = true;
    }

    subcategorySelect.appendChild(option);
  });
}


  clearSubcategorySelect() {
    const subcategorySelect = this.subcategoryTarget;
    if (!subcategorySelect) {
      console.error('Subcategory select target not found');
      return;
    }

    subcategorySelect.innerHTML = ""; // Clear existing options

    const promptOption = document.createElement("option");
    promptOption.value = "";
    promptOption.textContent = "Escolha uma subcategoria:";
    subcategorySelect.appendChild(promptOption);
  }
}
