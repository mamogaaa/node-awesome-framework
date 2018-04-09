const Generator = require('yeoman-generator');
const path = require('path');

module.exports = class extends Generator {
  prompting() {
    this.lang = 'js';
    this.appname = path.resolve('./').split(path.sep).pop();
    return this.prompt([{
      type: 'input',
      name: 'name',
      message: 'Your project name',
      default: this.appname // Default to current folder name
    }, {
      type: 'confirm',
      name: 'coffee',
      message: 'Use coffeescript?',
      default: true
    }, {
      type: 'list',
      name: 'packageManager',
      message: 'Select package manager',
      choices: ['yarn', 'npm'],
      default: 'yarn'
    }, {
      type: 'list',
      name: 'db',
      message: 'What database you need?',
      choices: ['pg', 'mysql', 'mariasql', 'sqlite3'],
      default: 'pg'
    }]).then((answers) => {
      this.appname = answers.name;
      if (answers.coffee) this.lang = 'coffee';
      this.database = answers.db;
      this.packageManager = answers.packageManager;
    });
  }

  install() {
    this[`${this.packageManager}Install`]([this.database, 'awesome-framework']);
  }

  getRandomKey (len = 10) {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for (var i = 0; i < len; i++)
      text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
  }

  app() {
    this.secretKey = this.getRandomKey(20);
    this.sourceRoot(path.join(__dirname, './templates'))
    console.log(this.database)
    this.fs.copy(
      this.templatePath('main/gitignore'),
      this.destinationPath('.gitignore')
    );
    this.fs.copy(
      this.templatePath('main/knexfile.js'),
      this.destinationPath('knexfile.js'),
    );
    this.fs.copy(
      this.templatePath('main/index.js'),
      this.destinationPath('index.js'),
    );
    this.fs.copy(
      this.templatePath('main/db'),
      this.destinationPath('db'),
    );
    this.fs.copyTpl(
      this.templatePath(`${this.lang}/awesome.config.${this.lang}`),
      this.destinationPath(`awesome.config.${this.lang}`),
      this
    );
    this.fs.copyTpl(
      this.templatePath(`${this.lang}/app`),
      this.destinationPath(`app`),
      this
    );
    this.fs.copyTpl(
      this.templatePath(`${this.lang}/configs`),
      this.destinationPath(`configs`),
      this
    );
    this.fs.copyTpl(
      this.templatePath(`${this.lang}/configs/centrifugo.example.json`),
      this.destinationPath(`configs/centrifugo.json`),
      this
    );
    this.fs.copyTpl(
      this.templatePath(`main/package.json`),
      this.destinationPath(`package.json`),
      this
    );
  }
};