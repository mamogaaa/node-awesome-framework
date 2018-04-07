
module.exports = {
  sayHello: async function(name) {
    var message;
    await awesome.sleep(1000);
    message = `Hello, ${name}!`;
    this.logger.info(message);
    return message;
  }
};
