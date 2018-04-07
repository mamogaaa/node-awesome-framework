{ ExampleModel } = awesome.models
module.exports =
  getExample: ->
    example = await ExampleModel.where({}).fetch()
    example.toJSON()