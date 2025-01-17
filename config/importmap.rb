# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
# pin "bootstrap" # @5.3.3
# pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "tom-select" # @2.3.1
pin "@stimulus-components/read-more", to: "@stimulus-components--read-more.js" # @5.0.0
pin "jquery", to: "jquery.min.js", preload: true
pin "cocoon", to: "cocoon/cocoon.min.js"
pin "flatpickr" # @4.6.13
pin "sweetalert2" # @11.14.5
