import 'dart:async';

import 'package:delivery_flutter_app/element/cards/card_special_offer.dart';
import 'package:delivery_flutter_app/element/cards/card_special_offer_detailed.dart';
import 'package:delivery_flutter_app/helper/screen_size_helper.dart';
import 'package:delivery_flutter_app/module/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AnimationController controller;
  Animation<Offset> offset;
  var isCardSelected = false;
  var shadowColor = Color.fromRGBO(0, 0, 0, 0.35);
  Timer timer;

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
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              NavigationBar(openDrawer),
              createListInBasket(),
            ],
          ),
          isCardSelected ?
          GestureDetector(
            onTap: (){
              closeDialog();
            },
            child: Container(
              color: shadowColor,
              height:ScreenSizeHelper.getHeight(),
              width:ScreenSizeHelper.getWidth(),
              child: SlideTransition(
                  position: offset, child: CardSpecialOfferDetailed(ScreenSizeHelper.getHeight()/3, ScreenSizeHelper.getWidth(), 8, '', 'Ролл Калифорния')),
            ),
          ) : Container(),
        ],
      ),
    );
  }

  Widget createListInBasket(){
    return Container(
      height: ScreenSizeHelper.getHeight(minus: NavigationBar.navBarHeight),
      child: ListView.builder
        (
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(onTap: (){
              opacity = 0.00;
              timer = Timer.periodic(Duration(microseconds: 750), (Timer t) => changeShadowColor());
              setState(() {
                isCardSelected = !isCardSelected;
                controller.forward();
                controller.reverse();
              });
            }
            ,child: CardSpecialOffer(ScreenSizeHelper.getHeight()/3, ScreenSizeHelper.getWidth(), 8, '', 'Ролл Калифорния'));
          }
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

  void openDrawer(){
//    Navigator.of(context).pop();
    _scaffoldKey.currentState.openDrawer();
  }

}
