import 'package:delivery_flutter_app/helper/text_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectorCount extends StatefulWidget {
  Color color;
  double width;
  double height;
  double cornersRadius;

  Function function1;
  Function function2;

  SelectorCount(Function function1, Function function2, Color color,
      double width, double height, double cornersRadius) {
    this.function1 = function1;
    this.function2 = function2;
    this.color = color;
    this.width = width;
    this.height = height;
    this.cornersRadius = cornersRadius;
  }

  @override
  _SelectorCountState createState() => _SelectorCountState();
}

class _SelectorCountState extends State<SelectorCount> {
  var selectedItems = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: widget.width,
            height: widget.height,
            child: RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.cornersRadius),
                  side: BorderSide(color: widget.color)),
              onPressed: () {},
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItems++;
                        widget.function1();
                      });
                    },
                    child: TextWidgetHelper.getStyledText("+",
                        fontSize: 16, fontWeight: FontWeight.w600)),
              )),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                    onTap: () {
                      if (selectedItems > 1) {
                        setState(() {
                          selectedItems--;
                          widget.function2();
                        });
                      }
                    },
                    child: TextWidgetHelper.getStyledText("-",
                        fontSize: 16, fontWeight: FontWeight.w600)),
              )),
          Align(
              alignment: Alignment.center,
              child: TextWidgetHelper.getStyledText(selectedItems.toString(),
                  fontSize: 16, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
