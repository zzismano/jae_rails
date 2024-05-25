import { Controller } from '@hotwired/stimulus';
import TomSelect from 'tom-select';

export default class extends Controller {
	connect() {
    console.log("this is tom-select");
		var settings = {}
		new TomSelect( this.element, settings)
	}
}
