log4js = require 'log4js'
sleep = require 'sleep-promise'
EventEmitter = require 'events'
compose = require 'koa-compose'
Koa = require 'koa'
http = require 'http'
path = require 'path'
requireGlob = require 'require-glob'

class Awesome extends EventEmitter
  constructor: (@config = {}) ->
    super()

Awesome::init = ->
  @sleep = sleep
  @requireGlob = requireGlob.sync
  @compose = compose
  @logger = log4js.getLogger()
  @logger.level = @config.logLevel || 'debug'
  @initializeConfig @config
  @logger.level = @config.logLevel

Awesome::customBootstrap = ->
  unless @config.bootstrap then return
  await @config.bootstrap()

Awesome::bootstrap = ->
  try
    @init() 
    @logger.info "Starting app..."
    await @initializeServices()
    await @initializeRedis()
    await @initializeDB()
    await @initializeServer()
    await @customBootstrap()
    @logger.info "App has been successfully started!"
    @emit 'appStart'
  catch err
    @logger.fatal "Can't start app! Error: #{err}"
    throw err

module.exports = Awesome

# require methods
methods = requireGlob.sync './methods/*.coffee'
for key, method of methods
  Awesome.prototype[key] = method
