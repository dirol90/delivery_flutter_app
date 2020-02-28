import 'package:delivery_flutter_app/helper/text_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardCategory extends StatelessWidget {

  double height;
  double width;
  double padding;
  String image;
  String name;

  CardCategory(double height, double width, double padding, String image, String name){
    this.height = height;
    this.width = width;
    this.padding = padding;
    this.image = image;
    this.name = name;
  }

  var cornerRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/screen_products');
      },
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Container(
          height: height,
          width: width,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect( borderRadius: BorderRadius.only(topRight: Radius.circular(cornerRadius), topLeft: Radius.circular(cornerRadius)), child: Image.asset('assets/images/placeholder_category.png', fit: BoxFit.fill, height: height / 3 * 2,)),
                Container(height: height / 3 - cornerRadius, child: Center(child: TextWidgetHelper.getStyledText(name, textAlign: TextAlign.center)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
