
import 'package:delivery_flutter_app/element/button/button_main.dart';
import 'package:delivery_flutter_app/element/cards/card_product_in_order.dart';
import 'package:delivery_flutter_app/helper/screen_size_helper.dart';
import 'package:delivery_flutter_app/helper/text_widget_helper.dart';
import 'package:delivery_flutter_app/module/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasketScreen extends StatefulWidget {
  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            createListInBasket(),
            createBottomPart(),
          ],
        ),
      ),
    );
  }

  Widget createListInBasket(){
    return Container(
      height: ScreenSizeHelper.getHeight(minus: NavigationBar.navBarHeight)/3*2,
      child: ListView.builder
        (
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return CardProductInOrders(ScreenSizeHelper.getHeight()/4, ScreenSizeHelper.getWidth(), 8, '', 'Ролл Калифорния');
          }
      ),
    );
  }

  Widget createBottomPart(){
    return Container(
      height: ScreenSizeHelper.getHeight(minus: NavigationBar.navBarHeight)/3*1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextWidgetHelper.getStyledText('Сумма без учета скидки:', fontWeight: FontWeight.w400, textAlign: TextAlign.start, fontSize: 12),
              TextWidgetHelper.getStyledText('310 грн', fontWeight: FontWeight.w600, textAlign: TextAlign.start, fontSize: 12),
            ],),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomRaisedButton(changeScreenDetails, Colors.orange, ScreenSizeHelper.getWidth()/5*3, 50.0, 26, 'ОФОРМИТЬ ЗАКАЗ'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomRaisedButton(changeScreenBase, Colors.white, ScreenSizeHelper.getWidth()/5*3, 50.0, 26, 'Продолжить покупки'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void changeScreenDetails(){
    setState(() {
      Navigator.pushReplacementNamed(context, '/screen_busket_detailed');
    });
  }

  void changeScreenBase(){
    setState(() {
      Navigator.pushReplacementNamed(context, '/');
    });
  }
}
