process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

// Disable source maps in production
environment.config.merge({ devtool: 'none' })

module.exports = environment.toWebpackConfig()
