module.exports =
  sayHello: (name) ->
    await awesome.sleep 1000
    message = "Hello, #{name}!"
    @logger.info message
    message
    