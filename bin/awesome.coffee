packageFile = require '../package.json'
program = require 'commander'
path = require 'path'
requireGlob = require('require-glob').sync
Awesome = require '../lib/Awesome.coffee'
chalk = require 'chalk'

initializeApp = (configPath) ->
  configPath ?= path.resolve './awesome.config.+(js|coffee)'
  config = requireGlob(configPath).awesomeConfig
  global.awesome = new Awesome config
  awesome.init()

initializeKnex = (overwriteConnection = {}) ->
  knexConfig = awesome.config.db[awesome.config.nodeEnv]
  [ require('knex')({ ...knexConfig, connection: { ...knexConfig.connection, ...overwriteConnection } }), knexConfig ]

program
.version packageFile.version, '-v, --version'
.option '-c, --config [config path]', 'Config path'

program
.command 'console [lang]'
.description 'Start app in interactive mode'
.action (lang) ->
  initializeApp program.config
  await awesome.bootstrap()
  lang ?= awesome.config.defaultLanguage
  require('./console.coffee') lang

program
.command 'start'
.description 'Start app'
.action ->
  initializeApp program.config
  await awesome.bootstrap()

program
.command 'init'
.description 'Initialize empty project.'
.action ->
  yeoman = require 'yeoman-environment'
  awesomeGenerator = require '../generators/app'
  env = yeoman.createEnv()
  env.registerStub awesomeGenerator, 'awesome:app'
  env.run 'awesome:app', (err) ->
    if err
      console.log chalk.red "Can't run generator; Err: #{err}"
      process.exit(1)

program
.command 'db:migrate:make <name>'
.description 'Create a named migration file.'
.action (name) ->
  initializeApp()
  [ knex, knexConfig ] = initializeKnex()
  try
    name = await knex.migrate.make name, extension: knexConfig.migrations.extension
    console.log chalk.green "Created Migration: #{name}"
    process.exit()
  catch err
    console.log chalk.red err.message
    process.exit(1)

program
.command 'db:migrate:latest'
.alias 'db:migrate'
.description 'Run all migrations that have not yet been run.'
.action ->
  initializeApp()
  [ knex, knexConfig ] = initializeKnex()
  try
    [ batchNo, log ] = await knex.migrate.latest()
    console.log chalk.green "Batch #{batchNo} run: #{log.length} migrations"
    process.exit()
  catch err
    console.log chalk.red err.message
    process.exit(1)

program
.command 'db:migrate:rollback'
.alias 'db:rollback'
.description 'Rollback the last set of migrations performed.'
.action ->
  initializeApp()
  [ knex, knexConfig ] = initializeKnex()
  try
    [ batchNo, log ] = await knex.migrate.rollback()
    console.log chalk.green "Batch #{batchNo} rolled back: #{log.length} migrations"
    process.exit()
  catch err
    console.log chalk.red err.message
    process.exit(1)

program
.command 'db:migrate:currentVersion'
.description 'View the current version for the migration.'
.action ->
  initializeApp()
  [ knex, knexConfig ] = initializeKnex()
  try
    version = await knex.migrate.currentVersion()
    console.log chalk.green "Current Version: #{version}"
    process.exit()
  catch err
    console.log chalk.red err.message
    process.exit(1)

program
.command 'db:seed:make <name>'
.description 'Create a named seed file.'
.action (name) ->
  initializeApp()
  [ knex, knexConfig ] = initializeKnex()
  try
    name = await knex.seed.make name, extension: knexConfig.migrations.extension
    console.log chalk.green "Created seed file: #{name}"
    process.exit()
  catch err
    console.log chalk.red err.message
    process.exit(1)

program
.command 'db:seed:run'
.alias 'db:seed'
.description 'Run seed files.'
.action ->
  initializeApp()
  [ knex, knexConfig ] = initializeKnex()
  try
    log = await knex.seed.run()
    console.log chalk.green "Ran #{log.length} seed files \n#{log.join('\n')}"
    process.exit()
  catch err
    console.log chalk.red err.message
    process.exit(1)

program
.command 'db:drop'
.description 'Drop database.'
.action ->
  initializeApp()
  [ knex, knexConfig ] = initializeKnex database: null
  try
    await knex.raw "DROP DATABASE #{knexConfig.connection.database};"
    console.log chalk.green "Dropped database #{knexConfig.connection.database}"
    process.exit()
  catch err
    console.log chalk.red err.message
    process.exit(1)

program
.command 'db:create'
.description 'Create database.'
.action ->
  initializeApp()
  [ knex, knexConfig ] = initializeKnex database: null
  try
    await knex.raw "CREATE DATABASE #{knexConfig.connection.database};"
    console.log chalk.green "Created database #{knexConfig.connection.database}"
    process.exit()
  catch err
    console.log chalk.red err.message
    process.exit(1)

program.parse process.argv