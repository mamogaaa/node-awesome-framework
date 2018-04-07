module.exports =
  show: (ctx) ->
    ctx.type = 'json'
    ctx.body = awesome.services.ExampleService.getExample()