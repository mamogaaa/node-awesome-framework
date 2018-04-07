
module.exports = function(ctx, next) {
  var name;
  name = ctx.params.name;
  if (name == null) {
    name = "world";
  }
  return ctx.body = "Hello, world!";
};
