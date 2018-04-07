module.exports = {
  appName: '<%= appname %>',
  defaultLanguage: '<%= lang %>',
  redis: {
    development: {},
    production: {},
    staging: {}
  },
  db: {
    development: {
      client: '<%= database %>',
      connection: {
        database: '<%= appname =>_dev'
      //   host: '127.0.0.1'
      //   user:     'postgres'
      //   password: 'password'
      },
      migrations: {
        directory: './db/migrations',
        extension: '<%= lang %>',
        loadExtensions: ['.js', '.coffee']
      },
      seeds: {
        directory: './db/seeds',
        extension: '<%= lang %>',
        loadExtensions: ['.js', '.coffee']
      }
    },
    staging: {
      client: '<%= database %>',
      connection: {
        database: '<%= appname =>_staging'
      //   host: '127.0.0.1'
      //   user:     'username'
      //   password: 'password'
      },
      pool: {
        min: 2,
        max: 10
      },
      migrations: {
        tableName: 'knex_migrations',
        directory: './db/migrations',
        extension: '<%= lang %>',
        loadExtensions: ['.js', '.coffee']
      },
      seeds: {
        directory: './db/seeds',
        extension: '<%= lang %>',
        loadExtensions: ['.js', '.coffee']
      }
    },
    production: {
      client: '<%= database %>',
      connection: {
        database: '<%= appname =>_production'
      //   host: '127.0.0.1'
      //   user:     'username'
      //   password: 'password'
      },
      pool: {
        min: 2,
        max: 10
      },
      migrations: {
        tableName: 'knex_migrations',
        directory: './db/migrations',
        extension: '<%= lang %>',
        loadExtensions: ['.js', '.coffee']
      },
      seeds: {
        directory: './db/seeds',
        extension: '<%= lang %>',
        loadExtensions: ['.js', '.coffee']
      }
    }
  }
};
