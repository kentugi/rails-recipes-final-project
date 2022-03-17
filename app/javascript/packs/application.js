// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "bootstrap";

import "controllers"
import { initStarRating } from '../plugins/init_star_rating';

initStarRating();

Rails.start()
Turbolinks.start()
ActiveStorage.start()


if (location.pathname === '/recipes') {
  Turbolinks.scroll = {};
}


document.addEventListener("turbolinks:load", ()=> {

  const elements = document.querySelectorAll("[data-turbolinks-scroll]");

  elements.forEach(function(element){

    element.addEventListener("click", ()=> {
      console.log(document.scrollingElement.scrollTop)
      Turbolinks.scroll['top'] = document.scrollingElement.scrollTop;
    });

    element.addEventListener("submit", ()=> {
      Turbolinks.scroll['top'] = document.scrollingElement.scrollTop;
    });

  });

  // if (Turbolinks.scroll['top']) {
  document.scrollingElement.scrollTo(0, Turbolinks.scroll['top']);
  // }

  Turbolinks.scroll = {};
});

app/javascript/packs/application.js
