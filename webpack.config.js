var elmSoruce = __dirname

module.exports = {
    module: {
        rules: [{
            test: /\.elm$/,
            exclude: [/elm-stuff/, /node_modules/],
            use: {
                loader: 'elm-webpack-loader',
                options: {
                    cwd: elmSoruce
                }
            }
        },
            {
                test: /\.html$/,
                exclude: /node_modules/,
                use: {
                    loader: 'file-loader?name=[name].[ext]'
                }
            }
        ]
    }
};