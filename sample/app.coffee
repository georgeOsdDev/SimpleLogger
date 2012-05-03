Logger = require("../src/SimpleLogger")
appLogger = new Logger("[APP]")
sysLogger = new Logger("[SYS]")

# default level is "DEBUG"
appLogger.log "Hello World I'm AppLogger"
sysLogger.log "Hello World I'm SYSLogger"

appLogger.trace "Trace!"
appLogger.debug "Debug!"
appLogger.info "Info!"
appLogger.warn "Warn!"
appLogger.error "Error!"
appLogger.fatal "Fatal!"

appLogger.setLevel('info')
appLogger.log "Hello World"

sysLogger.setLevel('error')
sysLogger.log "Hello World"
