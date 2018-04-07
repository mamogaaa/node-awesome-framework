var Router;

Router = require('koa-router');

module.exports = function() {
  var router;
  router = new Router;
  router.get('/', awesome.controllers.ExampleController.show);
  return router;
};
