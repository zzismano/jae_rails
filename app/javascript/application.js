// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "@popperjs/core";
import "bootstrap";
import "jquery";
import "cocoon";


// Wait for the document to be fully loaded before initializing Cocoon
if (typeof Cocoon !== 'undefined') {
  Cocoon.init();
}

window.onload = function() {
  const scrollableSection = document.querySelector('.main-section-cards');
  scrollableSection.scrollLeft = 0; // Scroll to the start when the page loads
};
