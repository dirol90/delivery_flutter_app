import 'package:delivery_flutter_app/element/button/button_main.dart';
import 'package:delivery_flutter_app/element/selctor/selector_count.dart';
import 'package:delivery_flutter_app/helper/text_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardProductInOrders extends StatefulWidget {

  double height;
  double width;
  double padding;
  String image;
  String name;

  CardProductInOrders(double height, double width, double padding, String image, String name){
    this.height = height;
    this.width = width;
    this.padding = padding;
    this.image = image;
    this.name = name;
  }

  @override
  _CardProductInOrdersState createState() => _CardProductInOrdersState();
}

class _CardProductInOrdersState extends State<CardProductInOrders> {
  var bigCornerRadius = 12.0;
  var smallCornerRadius = 8.0;
  var topBottomPadding = 8.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: topBottomPadding, right: topBottomPadding),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: widget.padding, top: topBottomPadding, bottom: topBottomPadding),
              child: Container(
                height: widget.height,
                width: widget.width/6*5,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(bigCornerRadius),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: topBottomPadding, bottom: topBottomPadding, right: topBottomPadding),
            child: Container(
              height: widget.height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect( borderRadius: BorderRadius.all(Radius.circular(smallCornerRadius)), child: Image.asset('assets/images/placeholder_category.png', fit: BoxFit.fill, height: widget.width / 10*2.5, width: widget.width / 5*2, )),
                  Container(
                    width: widget.width - widget.width / 5*2 - topBottomPadding*3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextWidgetHelper.getStyledText(widget.name, fontWeight: FontWeight.w600, textAlign: TextAlign.start, fontSize: 10),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextWidgetHelper.getStyledText('lorem ipsum dolor sit amet, consectetuer adipiscin elit, sed diam 	', fontWeight: FontWeight.w300, textAlign: TextAlign.start, fontSize: 9),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: widget.width / 10, bottom: topBottomPadding*2),
              child: Container(
                height: widget.height,
                width: widget.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextWidgetHelper.getStyledText('240 грн', fontWeight: FontWeight.w600, textAlign: TextAlign.start, fontSize: 10, color: Colors.grey),
                    SelectorCount(updateState, updateState, Colors.black, 100.0, 30.0, 16.0),
                    TextWidgetHelper.getStyledText('240 грн', fontWeight: FontWeight.w600, textAlign: TextAlign.start, fontSize: 12, color: Colors.black),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Function updateState(){
    setState(() {

    });
  }

}
