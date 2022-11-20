import 'package:logger/logger.dart';

class AppLogger {
  static final logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2, //number of method calls to be displayed
        errorMethodCount: 8, //number of method calls if starktrace is provided
        colors: true,
        lineLength: 200,
        printEmojis: true,
        printTime: false),
  );

  static void i(dynamic message) {
    logger.i(message);
  }

  static void d(dynamic message) {
    logger.d(message);
  }

  static void w(dynamic message) {
    logger.w(message);
  }

  static void wtf(dynamic message) {
    logger.wtf(message);
  }
}
