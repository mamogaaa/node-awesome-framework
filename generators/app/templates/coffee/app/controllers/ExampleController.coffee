{ ExampleService } = awesome.services
module.exports =
  show: (ctx) ->
    ctx.type = 'json'
    ctx.body = ExampleService.getExample()