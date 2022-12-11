// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

require('jquery')

import "popper.js";
import "bootstrap";
import "../stylesheets/application"

window.$ = window.jQuery = require('jquery');

import Raty from "../src/raty"
window.raty = function(elem,opt) {
    let raty =  new Raty(elem,opt)
    raty.init();
    return raty;
}

Rails.start()
Turbolinks.start()
ActiveStorage.start()
