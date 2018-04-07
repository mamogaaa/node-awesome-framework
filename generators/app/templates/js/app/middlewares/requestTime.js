module.exports = async function(ctx, next) {
  var ms, start;
  start = Date.now();
  await next();
  ms = Date.now() - start;
  ctx.set("X-Response-Time", `${ms}ms`);
  return awesome.logger.info(`${ctx.request.method.toUpperCase()} ${ctx.request.url} - ${ms}ms`);
};
