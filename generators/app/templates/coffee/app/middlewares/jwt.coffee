jwt = require 'koa-jwt'
module.exports = jwt
  secret: awesome.config.secretKey
  passthrough: true