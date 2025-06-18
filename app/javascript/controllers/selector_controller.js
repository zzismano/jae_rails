import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selector"
export default class extends Controller {

  static targets = ["filme", "teatro", "musica", "evento", "expo", "mais", "visão", "subcategory"]


  connect() {
    console.log(window.location.href);
  }

  select(event) {
  //  console.log(event.currentTarget.innerHTML);
    const filme = document.getElementById('filme')
    const musica = document.getElementById('musica')
    const teatro = document.getElementById('teatro')
    const danca = document.getElementById('danca')
    const visão = document.getElementById('visao')
    const evento = document.getElementById('evento')
    const expo = document.getElementById('expo')
    const mais = document.getElementById('mais')
    const logo = document.querySelector('.navbar-brand')
    const conteudoHome = document.getElementById('conteudo-home')
    const categorias = [filme, musica, teatro, danca, mais, evento, expo, visão]
    let click = event.currentTarget
    // var targetsCopia = this.constructor.targets
    // var index = targetsCopia.indexOf(event.currentTarget.id)

    function menu() {
      click.lastElementChild.classList.remove("d-none");
    }
    click.classList.add("transition")
    menu()
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
