redis = require 'async-redis'
module.exports = ->
  redisConfig = @config.redis
  unless redisConfig then return
  if @config.redis[@config.nodeEnv]
    redisConfig = @config.redis[@config.nodeEnv]
  @redis = redis.createClient redisConfig
  @logger.info "Initializing redis..."
  new Promise (resolve, reject) =>
    @redis.once 'ready', =>
      @logger.info "Redis connected!"
      resolve()
    @redis.once 'error', (err) => reject err