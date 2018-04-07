DEFAULT_CONFIG = require '../configs/default.coffee'
path = require 'path'

module.exports = (config) ->
  @config = { ...DEFAULT_CONFIG, ...config }

  @config.dirConfig.models ?= path.join @config.dirConfig.appRoot, './app/models/**/*.+(js|coffee)'
  @config.dirConfig.middlewares ?= path.join @config.dirConfig.appRoot, './app/middlewares/**/*.+(js|coffee)'
  @config.dirConfig.controllers ?= path.join @config.dirConfig.appRoot, './app/controllers/**/*.+(js|coffee)'
  @config.dirConfig.policies ?= path.join @config.dirConfig.appRoot, './app/policies/**/*.+(js|coffee)'
  @config.dirConfig.services ?= path.join @config.dirConfig.appRoot, './app/services/**/*.+(js|coffee)'
  @config.dirConfig.configs ?= path.join @config.dirConfig.appRoot, './configs/**/*.+(js|coffee)'
  
  configFiles = @requireGlob @config.dirConfig.configs
  @config = { ...@config, ...configFiles }
