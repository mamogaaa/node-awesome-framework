var ExampleModel;

({ExampleModel} = awesome.models);

module.exports = {
  getExample: async function() {
    var example;
    example = (await ExampleModel.where({}).fetch());
    return example.toJSON();
  }
};
