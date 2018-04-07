var ExampleService;

({ExampleService} = awesome.services);

module.exports = {
  show: function(ctx) {
    ctx.type = 'json';
    return ctx.body = ExampleService.getExample();
  }
};
