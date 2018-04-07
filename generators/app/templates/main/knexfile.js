require('coffeescript/register');
const path = require('path');
const requireGlob = require('require-glob').sync;
const Awesome = require('awesome-framework');

let config = null;
try {
  config = requireGlob(path.join(path.resolve('./'), './awesome.config.+(js|coffee)')).awesomeConfig;
} catch (err) {}
module.exports = global.awesome = new Awesome(config);
try {
  awesome.init();
} catch (err) {
  console.error(err);
  process.exit(1);
  return
}

module.exports = awesome.config.db;