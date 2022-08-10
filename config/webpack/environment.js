const { environment } = require('@rails/webpacker')
const erb = require('./loaders/erb')

// jquery導入時に下記を記述した
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)
// ここまで

environment.loaders.prepend('erb', erb)
module.exports = environment
