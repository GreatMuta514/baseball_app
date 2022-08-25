process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

module.exports = {
  entry: {
		'../../javascript/packs/application.js': './src/js/index.js',
	},
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [
          // [style-loader](/loaders/style-loader)
          { loader: 'style-loader' },
          // [css-loader](/loaders/css-loader)
          {
            loader: 'css-loader',
            options: {
              modules: true
            }
          },
          // [sass-loader](/loaders/sass-loader)
          { loader: 'sass-loader' }
        ]
      }
    ]
  }
};