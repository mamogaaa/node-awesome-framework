module.exports =
  order: (middlewares) ->
    [
      middlewares.utils.requestTime,
      middlewares.router
    ]