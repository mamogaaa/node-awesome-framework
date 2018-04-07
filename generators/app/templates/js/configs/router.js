
var Router;

Router = require('koa-router');

module.exports = function() {
  var router;
  router = new Router;
  router.get('/', awesome.middlewares.helloWorld);
  router.get('/:name', awesome.middlewares.helloWorld);
  return router;
};
