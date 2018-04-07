repl = require 'repl'
vm = require 'vm'
CoffeeScript = require 'coffeescript'
Babel = require 'babel-core'


class Console
  constructor: (@options = {}) ->
    @compiler = awesome.config.defaultLanguage
    if @options.compiler in ["coffee", "js"]
      @compiler = @options.compiler

    global.ans = null

Console.COMPILERS =
  coffee: (code, file) ->
    code = CoffeeScript.compile code,
      filename: file,
      bare: true
    Console.COMPILERS.js code, file

  js: (code, file) ->
    result = Babel.transform code,
      plugins: ["transform-async-to-generator"]
    result.code

Console::start = ->
  repl.start
    prompt: "#{@compiler}> ",
    eval: (code, context, file, cb) =>
      try
        code = Console.COMPILERS[@compiler] code, file
        result = vm.runInThisContext code
        if result && result.then && typeof result.then == 'function'
          result = await result
        global.ans = result
        cb null, result
      catch err
        cb err

module.exports = (compiler = 'coffee') ->
  ic = new Console compiler: compiler
  ic.start()
  ic