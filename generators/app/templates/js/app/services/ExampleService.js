module.exports = {
  getExample: async function() {
    var example;
    var { ExampleModel } = awesome.models;
    example = (await ExampleModel.where({}).fetch());
    return example.toJSON();
  }
};
