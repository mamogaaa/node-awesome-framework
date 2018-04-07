var Example;

Example = (function() {
  class Example extends awesome.bookshelf.Model {};

  Example.prototype.tableName = 'examples';

  return Example;

}).call(this);

module.exports = Example;
