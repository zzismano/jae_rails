import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2';
window.Swal = Swal;

// Connects to data-controller="share"
export default class extends Controller {
  static targets = ["botao", "id" ]
  connect() {
    console.log("hello from share controller");

  }

  copy(event) {
    const url = `${window.location.origin}/leisures/${this.idTarget.innerText}`
    console.log(this.idTarget.innerText);

    navigator.clipboard.writeText(url)
    event.currentTarget.disabled = true
    Swal.fire({
      title: 'Link copiado para a área de transferência',
      icon: 'success',
      iconColor: '#76285a',
      confirmButtonText: 'Já é!',
      confirmButtonColor: '#76285a'
    })
  }

  async share(e) {
    e.preventDefault();
    const url = `${window.location.origin}/leisures/${this.idTarget.innerText}`

    const shareData = {
      url: url
    };

    try {
      await navigator.share(shareData);
    } catch (err) {
      console.log(err);

    }
  }
}
