//= require jquery
//= require jquery_ujs

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// bootstrapの設定
// import { Tooltip, Toast, Popover } from "bootstrap";
// bootstrapのスタイルシート側の機能を読み込む
import "bootstrap/dist/css/bootstrap.min.css";
// bootstrapのjs側の機能を読み込む
import "bootstrap";
// スタイルシートの読み込み
import "../src/application";

// font-awesomeの設定
import '@fortawesome/fontawesome-free/js/all';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// webpackでimage_pack_tagヘルパーメソッドで画像を表示する
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

// require("bootstrap/dist/js/bootstrap");

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