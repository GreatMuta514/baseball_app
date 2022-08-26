const { environment } = require('@rails/webpacker')

module.exports = environment

// jquery導入時に下記を記述した
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: ['popper.js', 'default']
  })
);
// ここまで
