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
          },
          {
            loader: 'postcss-loader',
            options: {
              // `postcssOptions` is needed for postcss 8.x;
              // if you use postcss 7.x skip the key
              postcssOptions: {
                // postcss plugins, can be exported to postcss.config.js
                plugins: function () {
                  return [
                    require('autoprefixer')
                  ];
                }
              }
            }
          },
          // [sass-loader](/loaders/sass-loader)
          { loader: 'sass-loader' }
        ],
      }
    ]
  }
})