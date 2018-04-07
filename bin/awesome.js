#!/usr/bin/env node
require('coffeescript/register');
global.ARGS = require('node-args');
const path = require('path');
const requireGlob = require('require-glob').sync;
const Awesome = require('../lib/Awesome.coffee');

(async () => {
  let config = null;
  try {
    config = requireGlob(path.join(path.resolve('./'), './awesome.config.+(js|coffee)')).awesomeConfig;
  } catch (err) {}
  global.awesome = new Awesome(config);

  let command = ARGS.additional.shift();

  if (command == 'start' || command == 'console') {
    
    try {
      await awesome.bootstrap();
    } catch (err) {
      process.exit(1);
      return
    }
  }

  if (command == 'console') {
    return require('./console.coffee');
  }
})();