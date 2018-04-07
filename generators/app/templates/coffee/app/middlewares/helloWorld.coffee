module.exports = (ctx, next) ->
  name = ctx.params.name
  name ?= "world"
  ctx.body = "Hello, world!"