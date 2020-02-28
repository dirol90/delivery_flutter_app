import 'dart:async';
import 'package:delivery_flutter_app/element/cards/card_product_detailed.dart';
import 'package:delivery_flutter_app/module/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:delivery_flutter_app/element/cards/card_product.dart';
import 'package:delivery_flutter_app/helper/screen_size_helper.dart';
import 'package:delivery_flutter_app/module/navigation_bar.dart';


class ScreenProducts extends StatefulWidget {

  @override
  _ScreenProductsState createState() => _ScreenProductsState();
}

class _ScreenProductsState extends State<ScreenProducts> with SingleTickerProviderStateMixin {

  var isCardSelected = false;
  var shadowColor = Color.fromRGBO(0, 0, 0, 0.35);
  Timer timer;

  AnimationController controller;
  Animation<Offset> offset;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
        .animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerMain(),
      body: Stack(
        children: <Widget>[
          NavigationBar(openDrawer),
          Padding(
            padding: EdgeInsets.only(top: NavigationBar.navBarHeight),
            child: Container(
              height: ScreenSizeHelper.getHeight(minus: NavigationBar.navBarHeight),
              child: ListView.builder
                (
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: (){
                          opacity = 0.00;
                          timer = Timer.periodic(Duration(microseconds: 750), (Timer t) => changeShadowColor());
                      setState(() {
                        isCardSelected = !isCardSelected;
                        controller.forward();
                        controller.reverse();
                      });
                    }
                    , child: CardProduct(ScreenSizeHelper.getHeight()/4, ScreenSizeHelper.getWidth(), 8, '', 'Ролл Калифорния'));
                  }
              ),
            ),
          ),
          isCardSelected ?
          Container(
            color: shadowColor,
            height:ScreenSizeHelper.getHeight(),
            width:ScreenSizeHelper.getWidth(),
            child: SlideTransition(
              position: offset, child: CardProductDetailed(closeDialog, '', 'Ролл Калифорния'),),
          ) : Container(),
        ],
      ),
    );
  }

  Function closeDialog(){
              setState(() {
                opacity = 0.00;
                isCardSelected = !isCardSelected;
                controller.forward();
              });
  }

  void openDrawer(){
//    Navigator.of(context).pop();
      _scaffoldKey.currentState.openDrawer();
  }

  var opacity = 0.00;
  void changeShadowColor(){
    setState(() {
      if(opacity < 0.35) {
        opacity += 0.01;
        shadowColor = Color.fromRGBO(0, 0, 0, opacity);
      } else {
        timer?.cancel();
      }
    });
  }


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
