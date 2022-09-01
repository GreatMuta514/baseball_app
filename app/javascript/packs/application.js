//= require jquery
//= require jquery_ujs

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// bootstrapの設定（これがないとナビゲーションバーが効かないので注意）
import "bootstrap";

// font-awesomeの設定
import '@fortawesome/fontawesome-free/js/all';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// webpackでimage_pack_tagヘルパーメソッドで画像を表示する
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)