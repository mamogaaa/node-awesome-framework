// Generated by CoffeeScript 2.2.4
var jwt;

jwt = require('koa-jwt');

module.exports = jwt({
  secret: awesome.config.secretKey,
  passthrough: true
});
