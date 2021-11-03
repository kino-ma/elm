const path = require('path');
const webpack = require('webpack');
const HtmlWebPackPlugin = require('html-webpack-plugin');
const CopyPlugin = require("copy-webpack-plugin");


var elmSoruce = __dirname;

module.exports = {
  devServer: {
    hot: true,
    host: "0.0.0.0",
    port: 3001,
    historyApiFallback: true,
  },
  plugins: [
    // HTML
    new HtmlWebPackPlugin({
      template: path.resolve(__dirname, "src/index.html"),
      favicon: "./src/static/favicon.ico",
    }),
    // Hot reload
    new webpack.HotModuleReplacementPlugin(),
    // Just copy static files (image, etc.)
    new CopyPlugin({
      patterns: [
        { from: "src/public", to: "./" },
      ]
    })
  ],
  entry: "./src/index.js",
  output: {
    path: path.resolve(__dirname, "./dist"),
    filename: "main.js",
    hashFunction: "xxhash64",
  },
  module: {
    rules: [{
      test: /\.elm$/,
      exclude: [/elm-stuff/, /node_modules/],
      use: [
        { loader: 'elm-hot-webpack-loader' },
        {
          loader: 'elm-webpack-loader',
          options: {
            cwd: elmSoruce,
            debug: false
          }
        }
      ]
    },
      {
        test: /\.html$/i,
        loader: 'html-loader'
      },
      {
        test: /\.(css|scss)$/,
        include: [/src/],
        exclude: [/elm-stuff/, /node_modules/],
        use: [
          'style-loader',
          {
            'loader': 'css-loader',
            'options': {
              'modules': 'pure',
              'modules': {
                'localIdentName': '[name]__[local]',
              }
            },
          }
        ]
      },
      {
        test: /\.(png|svg|jpg|jpeg|gif)$/i,
        type: 'asset/resource',
      },
    ]
  }
};
