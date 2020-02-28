import 'package:delivery_flutter_app/element/button/button_main.dart';
import 'package:delivery_flutter_app/element/edit_text/border_edit_text.dart';
import 'package:delivery_flutter_app/helper/screen_size_helper.dart';
import 'package:delivery_flutter_app/helper/text_widget_helper.dart';
import 'package:delivery_flutter_app/module/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasketSuccessScreen extends StatefulWidget {
  @override
  _BasketSuccessScreenState createState() => _BasketSuccessScreenState();
}

class _BasketSuccessScreenState extends State<BasketSuccessScreen> {

  Future f ;

  @override
  Widget build(BuildContext context) {

    if (f == null ) f = Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        changeScreenHome();
      });
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextWidgetHelper.getStyledText('Спасибо за заказ!', fontWeight: FontWeight.w600, textAlign: TextAlign.center, fontSize: 21),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextWidgetHelper.getStyledText('Ожидайте звонок от нашего оператора', fontWeight: FontWeight.w400, textAlign: TextAlign.center, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('assets/images/busket_success.png', height: 105, width: 105,),
            ),
          ],
        ),
      ),
    );
  }

  void changeScreenHome(){
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  void dispose() {
    super.dispose();
    f = null;
  }


}
