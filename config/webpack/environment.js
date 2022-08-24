const { environment } = require('@rails/webpacker');

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
module.exports = environment;
