const path = require('path');
const webpack = require('webpack');
const HtmlWebPackPlugin = require('html-webpack-plugin');

var elmSoruce = __dirname;

module.exports = {
    devServer: {
        contentBase: [
            path.join(__dirname, './src'),
            path.join(__dirname, './dist'),
        ],
        hot: true,
        host: "0.0.0.0",
        port: 3001,
        inline: true,
        watchContentBase: true,
        historyApiFallback: true,
    },
    plugins: [
        new HtmlWebPackPlugin({
            template: path.resolve(__dirname, "src/index.html"),
            favicon: "./src/static/favicon.ico",
        }),
        new webpack.HotModuleReplacementPlugin(),
    ],
    entry: "./src/index.js",
    output: {
        path: path.resolve(__dirname, "./dist"),
        filename: "main.js",
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
        }
        ]
    }
};
