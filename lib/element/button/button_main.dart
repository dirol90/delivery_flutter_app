import 'package:delivery_flutter_app/helper/text_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomRaisedButton extends StatefulWidget {

  Function function;
  Color color;
  double width;
  double height;
  double cornersRadius;
  String text;

  CustomRaisedButton(Function function, Color color, double width, double height, double cornersRadius, String text){
    this.function = function;
    this.color = color;
    this.width = width;
    this.height = height;
    this.cornersRadius = cornersRadius;
    this.text = text;

  }

  @override
  _CustomRaisedButtonState createState() => _CustomRaisedButtonState();
}

class _CustomRaisedButtonState extends State<CustomRaisedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: RaisedButton(
        color: widget.color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.cornersRadius),
            side: BorderSide(color: widget.color)
        ), onPressed: () {widget.function();},
        child: TextWidgetHelper.getStyledText(widget.text, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
