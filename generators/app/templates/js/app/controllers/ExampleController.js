module.exports = {
  show: async function(ctx) {
    ctx.type = 'json';
    return ctx.body = await awesome.services.ExampleService.getExample();
  }
};
