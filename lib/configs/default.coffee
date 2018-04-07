path = require 'path'
module.exports = 
  port: 8081
  logLevel: if process.env.NODE_ENV == 'production' then 'production' else 'debug'
  defaultLanguage: 'coffee'
  dirConfig:
    appRoot: path.resolve('./')
  nodeEnv: process.env.NODE_ENV || 'development'
  db: 
    development: 
      client: 'postgresql'
      connection: 
        host: '127.0.0.1'
        database: 'prices_api_dev'
        user:     'postgres'
        password: 'your_database_password'
    staging: 
      client: 'postgresql'
      connection: 
        database: 'my_db'
        user:     'username'
        password: 'password'
      pool: 
        min: 2
        max: 10
      migrations: 
        tableName: 'knex_migrations'
    production: 
      client: 'postgresql'
      connection: 
        database: 'my_db'
        user:     'username'
        password: 'password'
      pool: 
        min: 2
        max: 10  
      migrations: 
        tableName: 'knex_migrations'