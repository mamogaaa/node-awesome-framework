module.exports = {
  getExample: async function() {
    var example;
    example = (await awesome.models.ExampleModel.where({}).fetch());
    return example.toJSON();
  }
};
