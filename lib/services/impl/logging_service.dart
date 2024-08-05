import 'package:logger/logger.dart';

class PrefixLogger {
  final String prefix;
  final Logger logger;

  PrefixLogger(this.prefix, this.logger);

  void d(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    var msg = "[$prefix] ${message.toString()}";
    logger.d(msg, time: time, error: error, stackTrace: stackTrace);
  }

  void e(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    var msg = "[$prefix] ${message.toString()}";
    logger.e(msg, time: time, error: error, stackTrace: stackTrace);
  }

  void i(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    var msg = "[$prefix] ${message.toString()}";
    logger.i(msg, time: time, error: error, stackTrace: stackTrace);
  }

  void w(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    var msg = "[$prefix] ${message.toString()}";
    logger.w(msg, time: time, error: error, stackTrace: stackTrace);
  }
}

class LoggingService {
  final Logger _logger;

  LoggingService(this._logger);

  PrefixLogger getLogger(String loggerName) {
    return PrefixLogger(loggerName, _logger);
  }

  static LoggingService createLogger() {
    var logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: true,
      ),
    );

    return LoggingService(logger);
  }
}
