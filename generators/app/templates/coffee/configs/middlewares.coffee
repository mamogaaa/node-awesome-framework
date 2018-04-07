module.exports =
  order: (middlewares) ->
    [
      middlewares.requestTime,
      middlewares.router
    ]