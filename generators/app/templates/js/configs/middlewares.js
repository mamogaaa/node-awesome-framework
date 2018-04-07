module.exports = {
  order: function(middlewares) {
    return [middlewares.requestTime, middlewares.router];
  }
};
