import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="header"
export default class extends Controller {
  static targets = [ "selectWhere" ]
  connect() {
    // console.log('Hello from Header!')
  }

  searchWhere(event) {

    let url = event.target.value;
    console.log(event.target);

    // limpa params anteriores
    if (url.match(/\?where=[a-z]+_[a-z]+\?where=/) || url.match(/\?where=[a-z]+\?where=/))  {
      const new_url = url.replace(/^.*(?=\?where=[a-z]+)/, '');
      let base = url.match(/\/[a-z]+/)[0];
      url = `${base}${new_url}`;
      console.log(new_url);
    } else if (url.match(/\?when=[a-z]+\?where=/)) {
      const new_url = url.replace(/\?when=[a-z]+/, '');
      url = `${new_url}`
      console.log(new_url);

    } else if (url.match(/\/[a-z]+\?subcategory=[1-9]+/)) {
      const new_url = url.replace(/^.*(?=\?where=[a-z]+)\?/, '');
      let base = url.match(/\/[a-z]+\?subcategory=[1-9]+/)[0];
      url = `${base}&${new_url}`;
      console.log(url);

    }

    const turboFrame = document.getElementById('content');
    turboFrame.src = url;


  }

  searchWhen(event) {


    let url = event.target.value;


    if (url.match(/\?when=[a-z]+\?when=[a-z]+/)) {

      const new_url = url.replace(/^.*(?=\?when=[a-z]+)/, '');
      const base = url.match(/\/[a-z]+/)[0];
      url = `${base}${new_url}`;
    } else if  (url.match(/\?where=[a-z]+\?when=/)) {
      const new_url = url.replace(/\?where=[a-z]+/, '');
      url = `${new_url}`;

    } else if (url.match(/\?where=[a-z]+_[a-z]+\?when=/)) {
      const new_url = url.replace(/\?where=[a-z]+_[a-z]+/, '');
      url = `${new_url}`;

    } else if (url.match(/\/[a-z]+\?subcategory=[0-9]+/)) {
      const new_url = url.replace(/^.*(?=\?when=[a-z]+)\?/, '');
      let base = url.match(/\/[a-z]+\?subcategory=[0-9]+/)[0];
      url = `${base}&${new_url}`;
      console.log(url);

    }



    const turboFrame = document.getElementById('content');
    turboFrame.src = url;
    event.target.value = '';

  }



  searchQueryAndWhere(event) {

    const turboFrame = document.getElementById('content');

    const results = new URL(turboFrame.src);

    let finalUrl;

    if (results.searchParams.has('where')) {
      results.searchParams.delete('where');
      results.searchParams.set('where', event.target.value)
      finalUrl = results.href;
    } else {
      finalUrl = `${turboFrame.src}&where=${event.target.value}`
    }
    turboFrame.src = finalUrl;
  }

  searchQueryAndWhen(event) {
    const turboFrame = document.getElementById('content');
    const results = new URL(turboFrame.src);
    let finalUrl;

    if (event.target.value === 'leisures') {
      finalUrl =`${results.origin}/${event.target.value}`;
      console.log('yas');

    }


    if (results.searchParams.has('when')) {
      results.searchParams.delete('when');
      results.searchParams.set('when', event.target.value);
      finalUrl = results.href;
    } else {
      finalUrl = `${turboFrame.src}&when=${event.target.value}`;
    }

    turboFrame.src = finalUrl;

  }



}
