const webpack = require("webpack")

import { ProvidePlugin } from 'webpack'
environment.plugins.append('Provide', new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)
module.exports = environment
