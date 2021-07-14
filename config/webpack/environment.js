const { environment } = require('@rails/webpacker')
const webpack = require("webpack");

// resolve-url-loader must be used before sass-loader
environment.loaders.get("sass").use.splice(-1, 0, {
  loader: "resolve-url-loader"
});

// https://github.com/webpack-contrib/sass-loader/issues/804
environment.loaders
  .get("sass")
  .use
  .find(item => item.loader === "sass-loader")
  .options = {
    sourceMap: true,
    webpackImporter: true,
    sassOptions: {
      includePaths: ["./node_modules"],
    },
    implementation: require("sass")
  }

// plugins
environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    Rails: "@rails/ujs"
  })
);

module.exports = environment
