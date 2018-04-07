module.exports = {
  show: function(ctx) {
    ctx.type = 'json';
    return ctx.body = awesome.services.ExampleService.getExample();
  }
};
