import 'dart:async';

import 'package:delivery_flutter_app/element/cards/card_history.dart';
import 'package:delivery_flutter_app/element/cards/card_special_offer.dart';
import 'package:delivery_flutter_app/element/cards/card_special_offer_detailed.dart';
import 'package:delivery_flutter_app/helper/screen_size_helper.dart';
import 'package:delivery_flutter_app/module/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              NavigationBar(openDrawer),
              createListInBasket(),
            ],
          ),
        ],
      ),
    );
  }

  Widget createListInBasket(){
    return Container(
      height: ScreenSizeHelper.getHeight(minus: NavigationBar.navBarHeight),
      child: ListView.builder
        (
        padding: EdgeInsets.all(0),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return CardHistory(ScreenSizeHelper.getHeight()/4, ScreenSizeHelper.getWidth(), 8, '', 'Ролл Калифорния');
          }
      ),
    );
  }

  void openDrawer(){
//    Navigator.of(context).pop();
    _scaffoldKey.currentState.openDrawer();
  }

}
