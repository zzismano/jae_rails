import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selector"
export default class extends Controller {

  static targets = ["filme", "teatro", "musica", "evento", "expo", "mais"]


  connect() {
    console.log(window.location.href);
  }

  select() {
  //  console.log(event.currentTarget.innerHTML);
    const filme = document.getElementById('filme')
    const musica = document.getElementById('musica')
    const teatro = document.getElementById('teatro')
    const evento = document.getElementById('evento')
    const expo = document.getElementById('expo')
    const mais = document.getElementById('mais')
    const logo = document.querySelector('.navbar-brand')
    const conteudoHome = document.getElementById('conteudo-home')
    const categorias = [filme, musica, teatro, mais, evento, expo]

    // var targetsCopia = this.constructor.targets
    // var index = targetsCopia.indexOf(event.currentTarget.id)
    event.currentTarget.classList.add("transition")
    event.currentTarget.lastElementChild.classList.remove("d-none")
    var copia = categorias.slice()
    copia.splice(categorias.indexOf(event.currentTarget), 1)

    copia.forEach((elemento) => {
      if (elemento.classList.contains("transition")) {
        elemento.classList.remove("transition")
        elemento.lastElementChild.classList.add("d-none")
      };



    });







  }
}