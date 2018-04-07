require('coffeescript/register');
const path = require('path');
const requireGlob = require('require-glob').sync;
const Awesome = require('awesome-framework');

(async () => {
  let config = null;
  try {
    config = requireGlob(path.join(path.resolve('./'), './awesome.config.+(js|coffee)')).awesomeConfig;
  } catch (err) {}

  global.awesome = new Awesome(config);
  try {
    await awesome.bootstrap();
  } catch (err) {
    process.exit(1);
    return
  }
})();