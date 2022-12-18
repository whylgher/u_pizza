abstract class AppLogger {
  void debud(dynamic message, [dynamic error, StackTrace? stackTrace]);
  void error(dynamic message, [dynamic error, StackTrace? stackTrace]);
  void warning(dynamic message, [dynamic error, StackTrace? stackTrace]);
  void info(dynamic message, [dynamic error, StackTrace? stackTrace]);
  void append(dynamic message);
  void closeAppend();
  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]);
}
