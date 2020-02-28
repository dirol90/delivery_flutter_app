import 'package:delivery_flutter_app/element/button/button_main.dart';
import 'package:delivery_flutter_app/element/edit_text/border_edit_text.dart';
import 'package:delivery_flutter_app/helper/screen_size_helper.dart';
import 'package:delivery_flutter_app/helper/text_widget_helper.dart';
import 'package:delivery_flutter_app/module/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasketDetailsScreen extends StatefulWidget {
  @override
  _BasketDetailsScreenState createState() => _BasketDetailsScreenState();
}

class _BasketDetailsScreenState extends State<BasketDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
              child: TextWidgetHelper.getStyledText('Оформление заказа', fontWeight: FontWeight.w600, textAlign: TextAlign.start, fontSize: 18),
            ),
            createEditTextPart('Ваше имя'),
            createEditTextPart('Ваш номер телефона'),
            createEditTextPart('Адрес доставки'),
            createEditTextPart('Ввести промо код'),
            createEditTextPart('Комментарий'),
            createBottomPart(),
          ],
        ),
      ),
    );
  }


  Widget createEditTextPart(text){
    return Container(
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextWidgetHelper.getStyledText(text, fontWeight: FontWeight.w500, textAlign: TextAlign.start, fontSize: 13),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: BorderEditText(text),
          ),
      ],),
    );
  }

  Widget createBottomPart(){
    return Container(
      height: ScreenSizeHelper.getHeight(minus: NavigationBar.navBarHeight)/9*2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextWidgetHelper.getStyledText('Сумма к оплате:', fontWeight: FontWeight.w400, textAlign: TextAlign.start, fontSize: 12),
                TextWidgetHelper.getStyledText('310 грн', fontWeight: FontWeight.w600, textAlign: TextAlign.start, fontSize: 12),
              ],),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomRaisedButton(changeScreenSuccess, Colors.orange, ScreenSizeHelper.getWidth()/5*3, 50.0, 26, 'ОТПРАВИТЬ ЗАКАЗ'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void changeScreenSuccess(){
    setState(() {
      Navigator.pushReplacementNamed(context, '/screen_busket_success');
    });
  }

}
