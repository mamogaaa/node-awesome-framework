// Generated by CoffeeScript 2.2.4
module.exports = {
  order: function(middlewares) {
    return [middlewares.requestTime, middlewares.session, middlewares.jwt, middlewares.router];
  }
};
