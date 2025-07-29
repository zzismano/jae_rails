import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["price"]

  connect() {
    console.log("Price-free controller connected")
    // Inicializar o estado baseado no valor atual
    this.updatePriceField()
  }

  togglePrice(event) {
    console.log("togglePrice called with value:", event.target.value)
    const isFree = event.target.value === "true"
    
    if (isFree) {
      console.log("Setting to FREE - clearing price field")
      // Se selecionou "Grátis", apenas limpar o campo
      this.priceTarget.value = ""
    }
    // Se selecionou "Pago", não fazer nada - campo permanece habilitado
  }

  updatePriceField() {
    console.log("updatePriceField called")
    // Verificar se algum radio button está selecionado
    const freeRadio = this.element.querySelector('input[value="true"]:checked')
    
    if (freeRadio) {
      console.log("FREE radio found - clearing price field")
      // Se "Grátis" está selecionado, apenas limpar o campo
      this.priceTarget.value = ""
    }
    // Em todos os outros casos, deixar o campo habilitado
  }
} 