import 'package:delivery_flutter_app/element/button/button_main.dart';
import 'package:delivery_flutter_app/helper/text_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardHistory extends StatelessWidget {

  double height;
  double width;
  double padding;
  String image;
  String name;

  CardHistory(double height, double width, double padding, String image, String name){
    this.height = height;
    this.width = width;
    this.padding = padding;
    this.image = image;
    this.name = name;
  }

  var smallCornerRadius = 20.0;
  var topBottomPadding = 8.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(topBottomPadding),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: height,
              width: width,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(smallCornerRadius),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: height - height/3*1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/images/busket_history.png', fit: BoxFit.fill, height: height/3*1, width: height/3*1, ),
                          ),
                          Container(
                            width: width - height/3*2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                TextWidgetHelper.getStyledText(name, fontWeight: FontWeight.w600, textAlign: TextAlign.start, fontSize: 12),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: TextWidgetHelper.getStyledText('lorem ipsum dolor sit amet, consectetuer adipiscin elit, sed diam 	', fontWeight: FontWeight.w300, textAlign: TextAlign.start, fontSize: 10),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextWidgetHelper.getStyledText('Итого: 360 грн ', fontWeight: FontWeight.w600, textAlign: TextAlign.start, fontSize: 12),
                        CustomRaisedButton(null, Colors.red, 150.0, 30.0, 16, 'Повторить заказ')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
