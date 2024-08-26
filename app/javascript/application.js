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
