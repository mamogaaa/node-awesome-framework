compose = require 'koa-compose'
Koa = require 'koa'
http = require 'http'

module.exports = ->
  @server = new Koa
  new Promise (resolve, reject) =>
    @initializeMiddlewares()
    http.createServer(@server.callback()).listen @config.port, (err) =>
      @logger.info "Listening on *:#{@config.port}"
      resolve()
    process.on 'uncaughtException', (err) =>
      if err.syscall == 'listen'
        @logger.warn "Can't start server! Error: #{err.message}"  
        resolve()
        return
      @logger.fatal err
