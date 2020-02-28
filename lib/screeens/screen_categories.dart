import 'package:delivery_flutter_app/module/drawer_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../element/cards/card_category.dart';
import '../module/navigation_bar.dart';
import '../helper/screen_size_helper.dart';

class CategoriesScreen extends StatefulWidget {

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var cardPaddingValue = 8.0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenSizeHelper(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerMain(),
      body: Column(
        children: <Widget>[
          NavigationBar(openDrawer),
          sliderGallery(),
          gridBody(),
        ],
      ),
    );
  }

  void openDrawer(){
//    Navigator.of(context).pop();
      _scaffoldKey.currentState.openDrawer();
  }

  Widget gridBody(){
    return Container(
      height: ScreenSizeHelper.getHeight(minus: NavigationBar.navBarHeight+(ScreenSizeHelper.getHeight()/10*3)) ,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) => CardCategory(ScreenSizeHelper.getWidth()/2-cardPaddingValue*2, ScreenSizeHelper.getWidth()/2-cardPaddingValue*2,  cardPaddingValue, '', index.toString()),
        itemCount: 4,
      ),
    );
  }

  Widget sliderGallery(){
    return CarouselSlider(
      height: ScreenSizeHelper.getHeight()/10*3,
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: ScreenSizeHelper.getWidth(),
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                    color: Colors.yellow
                ),
            );
          },
        );
      }).toList(),
    );
  }
}
