Router = require 'koa-router'

module.exports = () ->
  router = new Router
  router.get '/', awesome.controllers.ExampleController.show
  router