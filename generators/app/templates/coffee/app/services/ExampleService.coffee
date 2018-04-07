module.exports =
  getExample: ->
    example = await awesome.models.ExampleModel.where({}).fetch()
    example.toJSON()