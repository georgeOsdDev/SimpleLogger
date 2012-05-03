#
# SimpleLogger.coffee
# Copyright (c) 2012 Oshida.Takeharu
# Author : Oshida.Takeharu 
# Repository : git@github.com:georgeOsdDev/SimpleLogger.git
# Version: 1.0
# License: MIT License
#
# ----------------------------------------------
# How To
# Logger = require("path/to/SimpleLogger")
# sysLogger = new Logger("[SYS]")
# sysLogger.info "Hello, World!"
#
# --in your console--
# 2012-05-03 11:43:45  [ SYS ]  [ INFO ] Hello, World!
#

module.exports = class SimpleLogger

  constructor: (@prefix,level) ->
    @LEVEL = {
        FATAL : '[ FATAL ]'
        ERROR : '[ ERORR ]'
        WARN : '[ WARN ]'
        INFO : '[ INFO ]'
        DEBUG : '[ DEBUG ]'
        TRACE : '[ TRACE ]'
    }
    @level = if level then level else @LEVEL.DEBUG

  leftZeroPad: (num) ->
    if num < 10 then "0" + num else num 

  localeTime: ->
    date = new Date()
    ret = "#{ date.getFullYear() }
-#{ @leftZeroPad(date.getMonth() + 1) }
-#{ @leftZeroPad(date.getDate()) }
 #{ @leftZeroPad(date.getHours()) }
:#{ @leftZeroPad(date.getMinutes()) }
:#{ @leftZeroPad(date.getSeconds()) }"
    return ret

  print: (args...) ->
    args.unshift @prefix if @prefix
    args.unshift @localeTime()
    console?.log(args...)    

  log: (args...) ->
    @print @level, args...

  fatal: (args...) ->
    @print @LEVEL.FATAL, args...

  error: (args...) ->
    @print @LEVEL.ERROR, args...

  warn: (args...) ->
    @print @LEVEL.WARN, args...

  info: (args...) ->
    @print @LEVEL.INFO, args...

  debug: (args...) ->
    @print @LEVEL.DEBUG, args...

  trace: (args...) ->
    @print @LEVEL.TRACE, args...

  setLevel: (level) ->
    @level = @LEVEL[level.toUpperCase()] if level.toUpperCase() of @LEVEL
    return

  getLevel: ->
    @level
