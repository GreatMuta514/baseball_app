process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

module.exports = Object.assign({}, environment.toWebpackConfig(), {
  module: {
    rules: [
      {
        test: /\.(png|jpg|gif|svg)/,
        use: [
          {
            loader: 'file-loader',
            options: {
              name: 'dirname/[contenthash].[ext]',
            },
          },
        ]
      },
      {
        test: /\.scss$/,
        use: [
          // [style-loader](/loaders/style-loader)
          { loader: 'style-loader' },
          // [css-loader](/loaders/css-loader)
          {
            loader: 'css-loader',
            options: {
              modules: true
            }
          }
        ]
      }
    ]
  }
})