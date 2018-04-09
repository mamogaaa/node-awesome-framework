module.exports =
  order: (middlewares) ->
    [
      middlewares.requestTime
      middlewares.session
      middlewares.jwt
      middlewares.router
    ]