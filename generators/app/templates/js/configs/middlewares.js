module.exports = {
  order: function(middlewares) {
    return [middlewares.utils.requestTime, middlewares.router];
  }
};
