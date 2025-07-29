import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["price"]

  connect() {
    // Inicializar o estado baseado no valor atual
    this.updatePriceField()
  }

  togglePrice(event) {
    const isFree = event.target.value === "true"
    
    if (isFree) {
      // Se selecionou "Grátis", definir preço como 0
      this.priceTarget.value = "0"
      this.priceTarget.disabled = true
      this.priceTarget.style.backgroundColor = "#f8f9fa"
    } else {
      // Se selecionou "Pago", limpar o campo e habilitar
      this.priceTarget.value = ""
      this.priceTarget.disabled = false
      this.priceTarget.style.backgroundColor = ""
    }
  }

  updatePriceField() {
    // Verificar se algum radio button está selecionado
    const freeRadio = this.element.querySelector('input[value="true"]:checked')
    const paidRadio = this.element.querySelector('input[value="false"]:checked')
    
    if (freeRadio) {
      // Se "Grátis" está selecionado
      this.priceTarget.value = "0"
      this.priceTarget.disabled = true
      this.priceTarget.style.backgroundColor = "#f8f9fa"
    } else if (paidRadio) {
      // Se "Pago" está selecionado
      this.priceTarget.disabled = false
      this.priceTarget.style.backgroundColor = ""
    }
  }
} 