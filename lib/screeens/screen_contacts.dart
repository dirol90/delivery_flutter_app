import 'dart:async';

import 'package:delivery_flutter_app/element/cards/card_special_offer.dart';
import 'package:delivery_flutter_app/element/cards/card_special_offer_detailed.dart';
import 'package:delivery_flutter_app/helper/screen_size_helper.dart';
import 'package:delivery_flutter_app/helper/text_widget_helper.dart';
import 'package:delivery_flutter_app/module/drawer_main.dart';
import 'package:delivery_flutter_app/module/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerMain(),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              NavigationBar(openDrawer),
              Container(
                  width: 110.0,
                  height: 110.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              "https://i.imgur.com/BoN9kdC.png")
                      )
                  )),
              createContactCard(ScreenSizeHelper.getHeight() / 8, ScreenSizeHelper.getWidth(), 'www@gmail.com'),
              createContactCard(ScreenSizeHelper.getHeight() / 8, ScreenSizeHelper.getWidth(), '+380937500734'),
              createContactCard(ScreenSizeHelper.getHeight() / 8, ScreenSizeHelper.getWidth(), 'ул. Екатерининская, 13/115, г.Одесса')
            ],
          ),
        ],
      ),
    );
  }

  void openDrawer(){
//    Navigator.of(context).pop();
    _scaffoldKey.currentState.openDrawer();
  }

  Widget createContactCard(height, width, text){
    return Container(
      height: height,
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child:
        TextWidgetHelper.getStyledText(text, fontWeight: FontWeight.w600, textAlign: TextAlign.start, fontSize: 12),),
      ),
    );
  }
}
