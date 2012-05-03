SimpleLogger.coffee
=============

勉強用coffeeScriptのLogger.

[log4js](http://log4js.berlios.de/)使ったほうがいい。

How To
-------
app.coffee

	Logger = require("path/to/SimpleLogger")
	sysLogger = new Logger("[SYS]")
	sysLogger.info "Hello, World!"


in your console

	2012-05-03 13:51:46 [APP] [ INFO ] Hello, World!


Log Level
-------
- trace
- debug (default level)
- info
- warn
- error
- fatal