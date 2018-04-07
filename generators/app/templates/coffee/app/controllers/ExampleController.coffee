module.exports =
  show: (ctx) ->
    ctx.type = 'json'
    ctx.body = await awesome.services.ExampleService.getExample()