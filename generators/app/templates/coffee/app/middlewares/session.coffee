session = require 'koa-generic-session'
redisStore = require 'koa-redis'

module.exports = session
  store: if awesome.redis then redisStore awesome.config.redis