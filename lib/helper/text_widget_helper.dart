import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidgetHelper {

  static Widget getStyledText(String text, {Color color = Colors.black, double fontSize = 14.0, FontStyle fontStyle  = FontStyle.normal, FontWeight fontWeight = FontWeight.w400, String fontFamily = 'RobotoMono', TextAlign textAlign = TextAlign.start} ){
    return Text(text, style: TextStyle(color: color, fontSize: fontSize, fontStyle: fontStyle, fontWeight: fontWeight, fontFamily: fontFamily), textAlign: textAlign,);
  }

}
