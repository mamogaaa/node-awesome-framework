Router = require 'koa-router'

module.exports = () ->
  router = new Router
  router.get '/', awesome.middlewares.helloWorld
  router.get '/:name', awesome.middlewares.helloWorld
  router