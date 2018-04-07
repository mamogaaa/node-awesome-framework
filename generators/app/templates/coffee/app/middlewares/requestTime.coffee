module.exports = (ctx, next) ->
  start = Date.now()
  await next()
  ms = Date.now() - start
  ctx.set "X-Response-Time", "#{ms}ms"
  awesome.logger.info "#{ctx.request.method.toUpperCase()} #{ctx.request.url} - #{ms}ms"