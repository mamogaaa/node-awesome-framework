path = require 'path'
module.exports = ->
  @middlewares = @requireGlob @config.dirConfig.middlewares
  @policies = @requireGlob @config.dirConfig.policies
  @controllers = @requireGlob @config.dirConfig.controllers
  if typeof @config.router == 'function'
    @router = @config.router()
    @middlewares.router = @compose([@router.routes(), @router.allowedMethods()])
  if @config.middlewares && typeof @config.middlewares.order == 'function'
    order = @config.middlewares.order @middlewares
    for middleware in order
      @server.use middleware