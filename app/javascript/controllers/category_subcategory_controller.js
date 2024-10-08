// app/javascript/controllers/category_subcategory_controller.js
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category-subcategory"
export default class extends Controller {
  static targets = ["subcategory"]
  static values = { subcategoryId: Number }

  connect() {
    if (this.hasSubcategoryIdValue) {
      this.updateSubcategorySelectOnLoad()
    }
  }

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
      if (subcategory.id === this.subcategoryIdValue) { // Select the option
        option.selected = true;
      }
      subcategorySelect.appendChild(option);
    });
  }

  updateSubcategorySelectOnLoad() {
    const categoryId = this.element.querySelector('#leisure_category_id').value;
    if (categoryId) {
      this.update({ target: { value: categoryId } });
    }
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
