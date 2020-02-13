extends Node

var savefile

func test():
	Logger.fine("test fine")
	Logger.trace("test trace")
	Logger.debug("test debug")
	Logger.info("test info")
	Logger.warn("test warning")
	Logger.error("test error")
	Logger.fatal("test fatal")


func run_test_at_level(test, level, iter):
	Logger.set_logger_level(level)
	run_test(test, level, iter)


func run_test(test, level, iter):
	var st = OS.get_ticks_msec()
	for i in range(iter):
		test()
	var et = OS.get_ticks_msec()
	var tt = et - st
	var s = "%s, %d, %d, %d" % [test, level, iter, tt]
	savefile.store_line(s)


func start_test_at_level(test, iters):

	for i in (iters):
		run_test_at_level(test, Logger.LOG_LEVEL_ALL, i)
		run_test_at_level(test, Logger.LOG_LEVEL_FINE, i)
		run_test_at_level(test, Logger.LOG_LEVEL_TRACE, i)
		run_test_at_level(test, Logger.LOG_LEVEL_DEBUG, i)
		run_test_at_level(test, Logger.LOG_LEVEL_INFO, i)
		run_test_at_level(test, Logger.LOG_LEVEL_WARN, i)
		run_test_at_level(test, Logger.LOG_LEVEL_ERROR, i)
		run_test_at_level(test, Logger.LOG_LEVEL_FATAL, i)


func start_test(test, iters):

	for i in (iters):
		run_test(test, Logger.LOG_LEVEL_ALL, i)
		run_test(test, Logger.LOG_LEVEL_FINE, i)
		run_test(test, Logger.LOG_LEVEL_TRACE, i)
		run_test(test, Logger.LOG_LEVEL_DEBUG, i)
		run_test(test, Logger.LOG_LEVEL_INFO, i)
		run_test(test, Logger.LOG_LEVEL_WARN, i)
		run_test(test, Logger.LOG_LEVEL_ERROR, i)
		run_test(test, Logger.LOG_LEVEL_FATAL, i)

func console_appender_tests(iters):
	"""
		clear all appenders
	"""
	Logger.logger_appenders.clear()

	"""
		default test is with one appender
	"""
	var test = "one-console-appenders"
	Logger.add_appender(ConsoleAppender.new())
	start_test_at_level(test, iters)

	"""
		add a second appender
	"""
	test = "two-console-appenders"
	Logger.add_appender(ConsoleAppender.new())
	start_test_at_level(test, iters)

	"""
		add a third appender
	"""
	test = "three-console-appenders"
	Logger.add_appender(ConsoleAppender.new())
	start_test_at_level(test, iters)

	"""
		add a fourth appender
	"""
	test = "four-console-appenders"
	Logger.add_appender(ConsoleAppender.new())
	start_test_at_level(test, iters)


func file_appender_tests(iters):
	"""
		clear all appenders
	"""
	Logger.logger_appenders.clear()

	"""
		add a file appender
	"""
	var test = "one-file-appenders"
	Logger.add_appender(FileAppender.new(".test/1.log"))
	start_test_at_level(test, iters)

	"""
		add a file appender
	"""
	test = "two-file-appenders"
	Logger.add_appender(FileAppender.new(".test/2.log"))
	start_test_at_level(test, iters)

	"""
		add a file appender
	"""
	test = "three-file-appenders"
	Logger.add_appender(FileAppender.new(".test/3.log"))
	start_test_at_level(test, iters)

	"""
		add a file appender
	"""
	test = "four-file-appenders"
	Logger.add_appender(FileAppender.new(".test/4.log"))
	start_test_at_level(test, iters)


func html_appender_tests(iters):
	"""
		clear all appenders
	"""
	Logger.logger_appenders.clear()

	"""
		add a html appender
	"""
	var test = "one-html-appenders"
	var a1 = FileAppender.new(".test/1.html")
	a1.layout = HtmlLayout.new()
	Logger.add_appender(a1)
	start_test_at_level(test, iters)

	"""
		add a html appender
	"""
	test = "two-html-appenders"
	var a2 = FileAppender.new(".test/2.html")
	a2.layout = HtmlLayout.new()
	Logger.add_appender(a2)
	start_test_at_level(test, iters)

	"""
		add a html appender
	"""
	test = "three-html-appenders"
	var a3 = FileAppender.new(".test/3.html")
	a3.layout = HtmlLayout.new()
	Logger.add_appender(a3)
	start_test_at_level(test, iters)

	"""
		add a html appender
	"""
	test = "four-html-appenders"
	var a4 = FileAppender.new(".test/4.html")
	a4.layout = HtmlLayout.new()
	Logger.add_appender(a4)
	start_test_at_level(test, iters)


func multi_appender_test(iters):
	"""
		clear all appenders
	"""
	Logger.logger_appenders.clear()

	"""
		add a console appender for fatal errors
	"""
	var test = "multi-appenders"
	var ca = ConsoleAppender.new()
	ca.logger_level = Logger.LOG_LEVEL_ERROR
	Logger.add_appender(ca)

	"""
		add a file appender for info
	"""
	var fa = FileAppender.new(".test/multi.log")
	fa.logger_level = Logger.LOG_LEVEL_INFO
	Logger.add_appender(fa)

	"""
		add a html appender for all
	"""
	var ha = FileAppender.new(".test/multi.html")
	ha.layout = HtmlLayout.new()
	ha.logger_level = Logger.LOG_LEVEL_ALL
	Logger.add_appender(ha)

	start_test_at_level(test, iters)


func _ready():

	savefile = File.new()
	savefile.open(".test/performance.csv", File.WRITE)
	savefile.store_line("test, level, iterations, total_time")

	var iters = [10, 25, 100, 250]
	console_appender_tests(iters)
	file_appender_tests(iters)
	html_appender_tests(iters)
	multi_appender_test(iters)

	savefile.close()
	print("Done!")

	get_tree().quit()
