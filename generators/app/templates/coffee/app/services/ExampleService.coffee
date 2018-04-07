module.exports =
  getExample: ->
    { ExampleModel } = awesome.models
    example = await ExampleModel.where({}).fetch()
    example.toJSON()