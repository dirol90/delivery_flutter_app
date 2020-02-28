import 'package:flutter/widgets.dart';

class ScreenSizeHelper {

  static BuildContext _context;

  ScreenSizeHelper(BuildContext context){
    _context = context;
  }

  static double getWidth({double minus = 0}){
    return MediaQuery.of(_context).size.width - minus;
  }

  static double getHeight({double minus = 0}){
    return MediaQuery.of(_context).size.height - minus;
  }



}