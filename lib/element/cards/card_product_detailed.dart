import 'package:delivery_flutter_app/element/button/button_main.dart';
import 'package:delivery_flutter_app/element/selctor/selector_count.dart';
import 'package:delivery_flutter_app/helper/screen_size_helper.dart';
import 'package:delivery_flutter_app/helper/text_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardProductDetailed extends StatefulWidget {

  String image;
  String name;
  Function f;

  CardProductDetailed(Function f, String image, String name){
    this.f =f;
    this.image = image;
    this.name = name;
  }

  @override
  _CardProductDetailedState createState() => _CardProductDetailedState();
}

class _CardProductDetailedState extends State<CardProductDetailed> {
  var bigCornerRadius = 24.0;
  var smallCornerRadius = 12.0;
  var leftRightPadding = 4.0;
  var selectedItems = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftRightPadding, right: leftRightPadding),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(right: leftRightPadding, left: leftRightPadding),
              child: Container(
                height: ScreenSizeHelper.getHeight()/20*17,
                width: ScreenSizeHelper.getWidth(),
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(bigCornerRadius), topLeft: Radius.circular(bigCornerRadius)),
                  ),
                  child:          Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(alignment: Alignment.topRight, child: Padding(
                        padding: const EdgeInsets.only(right: 16.0, top: 16.0),
                        child: GestureDetector(onTap: (){
                          widget.f();
                        }
                        ,child: Icon(Icons.close, size: 24,)),
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextWidgetHelper.getStyledText(widget.name, fontWeight: FontWeight.w600, textAlign: TextAlign.center, fontSize: 24),
                      ),
                      Image.asset('assets/images/placeholder_category.png', fit: BoxFit.cover, height: ScreenSizeHelper.getHeight()/6*2, width: ScreenSizeHelper.getWidth() / 10*9, ),
                      Container(
                        width:ScreenSizeHelper.getHeight()/10*9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextWidgetHelper.getStyledText('Рис, Авокад, Мясо краба, Икра Тобико something', fontWeight: FontWeight.w300, textAlign: TextAlign.start, fontSize: 10),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextWidgetHelper.getStyledText('lorem ipsum dolor sit amet, consectetuer adipiscin elit, sed diam 	', fontWeight: FontWeight.w300, textAlign: TextAlign.start, fontSize: 10),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  TextWidgetHelper.getStyledText('120 грн', fontWeight: FontWeight.w600, textAlign: TextAlign.start, fontSize: 12),
                                  TextWidgetHelper.getStyledText('250 g', fontWeight: FontWeight.w600, textAlign: TextAlign.start, fontSize: 12),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(indent: 2.0, color: Colors.black,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  TextWidgetHelper.getStyledText('Итого: 240 грн', fontWeight: FontWeight.w600, textAlign: TextAlign.start, fontSize: 12),
                                  SelectorCount(plusCounter, minusCounter, Colors.black, 125.0, 30.0, 16.0),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomRaisedButton(null , Colors.red, ScreenSizeHelper.getWidth()/5*3, 40.0, 26, 'Добавить $selectedItems в корзину'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Function plusCounter(){
    setState(() {
      selectedItems++;
    });
  }

  Function minusCounter(){
    if (selectedItems > 1) {
      setState(() {
        selectedItems--;
      });
    }
  }
}
