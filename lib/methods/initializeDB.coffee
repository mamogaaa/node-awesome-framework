path = require 'path'
knex = require 'knex'
bookshelf = require('bookshelf')
module.exports = ->
  @knex = knex @config.db[@config.nodeEnv]
  @bookshelf = bookshelf @knex
  @models = @requireGlob @config.dirConfig.models