module.exports =
  order: (middlewares) ->
    [
      middlewares.requestTime
      middlewares.session
      middlewares.router
    ]