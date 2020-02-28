import 'package:delivery_flutter_app/element/button/button_main.dart';
import 'package:delivery_flutter_app/helper/text_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardProduct extends StatelessWidget {

  double height;
  double width;
  double padding;
  String image;
  String name;

  CardProduct(double height, double width, double padding, String image, String name){
    this.height = height;
    this.width = width;
    this.padding = padding;
    this.image = image;
    this.name = name;
  }

  var bigCornerRadius = 24.0;
  var smallCornerRadius = 12.0;
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
              padding: EdgeInsets.only(right: padding, top: topBottomPadding, bottom: topBottomPadding),
              child: Container(
                height: height,
                width: width/6*5,
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
              height: height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect( borderRadius: BorderRadius.all(Radius.circular(smallCornerRadius)), child: Image.asset('assets/images/placeholder_category.png', fit: BoxFit.fill, height: height/3*2, width: width / 5*2, )),
                  Container(
                    width: width - width / 5*2 - topBottomPadding*3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextWidgetHelper.getStyledText(name, fontWeight: FontWeight.w600, textAlign: TextAlign.start, fontSize: 12),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextWidgetHelper.getStyledText('lorem ipsum dolor sit amet, consectetuer adipiscin elit, sed diam 	', fontWeight: FontWeight.w300, textAlign: TextAlign.start, fontSize: 10),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            TextWidgetHelper.getStyledText('120 грн.', fontWeight: FontWeight.w600, textAlign: TextAlign.start, fontSize: 12),
                            CustomRaisedButton(null, Colors.red, 100.0, 30.0, 16, 'Заказать')
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
