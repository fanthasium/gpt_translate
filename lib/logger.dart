import 'package:logger/logger.dart';

class Logging{

  final Logger _logger;


  Logging()
      :_logger = Logger(
      printer: PrettyPrinter(methodCount: 3, colors: true, printEmojis: false)
  );

  void w(String message){
    _logger.w(message);
  }

  void e(String message){
    _logger.e(message);
  }


}


