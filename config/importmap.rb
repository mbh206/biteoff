# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "mapbox-gl", to: "https://ga.jspm.io/npm:mapbox-gl@3.1.2/dist/mapbox-gl.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.1.0/nodelibs/browser/process-production.js"
pin "star-rating.js", to: "https://cdn.jsdelivr.net/npm/star-rating.js@4.3.1/dist/star-rating.esm.js"
pin "sweetalert2", to: "https://ga.jspm.io/npm:sweetalert2@11.14.5/dist/sweetalert2.all.js"
pin "tom-select", to: "https://cdn.jsdelivr.net/npm/tom-select@2.4.1/dist/esm/tom-select.complete.js"
pin "@orchidjs/sifter", to: "https://cdn.jsdelivr.net/npm/@orchidjs/sifter@1.1.0/dist/esm/sifter.js"
pin "@orchidjs/unicode-variants", to: "https://cdn.jsdelivr.net/npm/@orchidjs/unicode-variants@1.1.2/dist/esm/index.js"
