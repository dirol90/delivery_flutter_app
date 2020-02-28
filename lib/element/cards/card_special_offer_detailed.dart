import 'package:delivery_flutter_app/helper/text_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardSpecialOfferDetailed extends StatelessWidget {

  double height;
  double width;
  double padding;
  String image;
  String name;

  CardSpecialOfferDetailed(double height, double width, double padding, String image, String name){
    this.height = height;
    this.width = width;
    this.padding = padding;
    this.image = image;
    this.name = name;
  }

  var bigCornerRadius = 24.0;
  var smallCornerRadius = 24.0;
  var topBottomPadding = 12.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: topBottomPadding, right: topBottomPadding),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(top: topBottomPadding*12, bottom: topBottomPadding),
              child: Container(
                height: height*1.5,
                width: width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(bigCornerRadius),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only( bottom: topBottomPadding),
            child: Container(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect( borderRadius: BorderRadius.all(Radius.circular(smallCornerRadius)), child: Image.asset('assets/images/placeholder_category.png', fit: BoxFit.fill, height: height/10*7, width: width / 10*7, )),
                  Container(
                    height: height/2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0, top: 8.0),
                          child: TextWidgetHelper.getStyledText(name, fontWeight: FontWeight.w600, textAlign: TextAlign.start, fontSize: 12),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                          child: TextWidgetHelper.getStyledText('пн-чт с 10.00 до 15.00', fontWeight: FontWeight.w300, textAlign: TextAlign.start, fontSize: 10),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: TextWidgetHelper.getStyledText('lorem ipsum dolor sit amet, consectetuer adipiscin elit, sed diam 	', fontWeight: FontWeight.w300, textAlign: TextAlign.start, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
