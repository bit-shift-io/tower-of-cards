extends Node


func _try_logging():
	Logger.fine("test fine")
	Logger.trace("test trace")
	Logger.trace("test debug")
	Logger.info("test info")
	Logger.warn("test warning")
	Logger.error("test error")
	Logger.fatal("test fatal")


func _ready():

	Logger.logger_appenders.clear()
	var h0 = Logger.add_appender(FileAppender.new("res://.test/new.html"))
	h0.layout = HtmlLayout.new()
	h0.logger_level = Logger.LOG_LEVEL_WARN
	h0.logger_format = Logger.LOG_FORMAT_FULL
	_try_logging()

	Logger.logger_appenders.clear()
	var f0 = Logger.add_appender(FileAppender.new())
	f0.logger_level = Logger.LOG_LEVEL_WARN
	f0.logger_format = Logger.LOG_FORMAT_FULL
	_try_logging()

	Logger.logger_appenders.clear()
	var c0 = Logger.add_appender(ConsoleAppender.new())
	c0.logger_format = Logger.LOG_FORMAT_DEFAULT
	c0.logger_level = Logger.LOG_LEVEL_WARN
	_try_logging()
	c0.logger_format = Logger.LOG_FORMAT_FULL
	c0.logger_level = Logger.LOG_LEVEL_WARN
	_try_logging()
	c0.logger_format = Logger.LOG_FORMAT_MORE
	c0.logger_level = Logger.LOG_LEVEL_WARN
	_try_logging()
	c0.logger_format = Logger.LOG_FORMAT_NONE
	c0.logger_level = Logger.LOG_LEVEL_WARN
	_try_logging()
	c0.logger_format = Logger.LOG_FORMAT_SIMPLE
	c0.logger_level = Logger.LOG_LEVEL_WARN
	_try_logging()

	Logger.logger_appenders.clear()
	var ca = Logger.add_appender(ConsoleAppender.new())
	ca.logger_format = Logger.LOG_FORMAT_FULL
	ca.logger_level = Logger.LOG_LEVEL_ALL
	_try_logging()
	ca.logger_level = Logger.LOG_LEVEL_FINE
	_try_logging()
	ca.logger_level = Logger.LOG_LEVEL_TRACE
	_try_logging()
	ca.logger_level = Logger.LOG_LEVEL_DEBUG
	_try_logging()
	ca.logger_level = Logger.LOG_LEVEL_INFO
	_try_logging()
	ca.logger_level = Logger.LOG_LEVEL_WARN
	_try_logging()
	ca.logger_level = Logger.LOG_LEVEL_ERROR
	_try_logging()
	ca.logger_level = Logger.LOG_LEVEL_FATAL
	_try_logging()

	print("Done!")