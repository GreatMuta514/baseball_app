// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery
//= require jquery_ujs

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
// bootstrapの設定
import "bootstrap";
import "../src/application";
// font-awesomeの設定
import '@fortawesome/fontawesome-free/js/all';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

require("bootstrap/dist/js/bootstrap");

// $(function() {
//   function readURL(input) {
//       if (input.files && input.files[0]) {
//       var reader = new FileReader();
//       reader.onload = function (e) {
//   $('#profile_preview').attr('src', e.target.result);
//       }
//       reader.readAsDataURL(input.files[0]);
//       }
//   }
//   $("#profile").change(function(){
//       readURL(this);
//   });
// });