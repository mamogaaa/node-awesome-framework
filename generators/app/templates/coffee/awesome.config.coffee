module.exports =
  appName: '<%= appname %>'
  defaultLanguage: 'coffee'
  redis: 
    development: {}
    production: {}
    staging: {}
  db: 
    development: 
      client: '<%= database %>'
      connection: {}
      # connection: 
      #   host: '127.0.0.1'
      #   database: 'prices_api_dev'
      #   user:     'postgres'
      #   password: 'your_database_password'
      migrations:
        directory: './db/migrations'
        extension: 'coffee'
        loadExtensions: ['.js', '.coffee']
      seeds:
        directory: './db/seeds'
        extension: 'coffee'
        loadExtensions: ['.js', '.coffee']


    staging: 
      client: '<%= database %>'
      connection: {}
      # connection: 
      #   database: 'my_db'
      #   user:     'username'
      #   password: 'password'
      pool: 
        min: 2
        max: 10
      migrations: 
        tableName: 'knex_migrations'
        directory: './db/migrations'
        extension: 'coffee'
        loadExtensions: ['.js', '.coffee']
      seeds:
        directory: './db/seeds'
        extension: 'coffee'
        loadExtensions: ['.js', '.coffee']

    production: 
      client: '<%= database %>'
      connection: {}
      # connection: 
      #   database: 'my_db'
      #   user:     'username'
      #   password: 'password'
      pool: 
        min: 2
        max: 10  
      migrations: 
        tableName: 'knex_migrations'
        directory: './db/migrations'
        extension: 'coffee'
        loadExtensions: ['.js', '.coffee']
      seeds:
        directory: './db/seeds'
        extension: 'coffee'
        loadExtensions: ['.js', '.coffee']