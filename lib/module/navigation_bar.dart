import 'package:delivery_flutter_app/helper/screen_size_helper.dart';
import 'package:delivery_flutter_app/helper/text_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationBar extends StatefulWidget {

  Color _color;
  static var navBarHeight = ScreenSizeHelper.getHeight()/10;
  Function f;

  NavigationBar(Function f, {color = Colors.blue}){
    _color = color;
    this.f = f;
  }

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {

  double standardWidth = 25;
  double standardPadding = 25;

  @override
  Widget build(BuildContext context) {
    ScreenSizeHelper(context);


    return Container(
      color: widget._color,
      height: ScreenSizeHelper.getHeight()/10,
      width:  ScreenSizeHelper.getWidth(),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(onTap: (){widget.f();},child: wrapWidget(Image.asset('assets/icons/navigation_menu_icon.png', height: 16, width: standardWidth, color: Colors.black,), standardWidth, 0)),
            wrapWidget(TextWidgetHelper.getStyledText('Название'), checkFreeWidth(), standardPadding),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/screen_busket');
                },
              child:wrapWidget(Icon(Icons.search, size: standardWidth,), standardWidth, standardPadding/2),),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/screen_busket');
                },
              child:wrapWidget(Icon(Icons.shopping_cart, size: standardWidth,), standardWidth, standardPadding/2),),
          ],
        ),
      ),
    );
  }

  Widget wrapWidget(Widget w, double width, double padding){
    return Container(
      width: width,
        child: Padding(
          padding: EdgeInsets.only(left: padding, right: padding),
          child: w,
        ),
    );
  }


  double checkFreeWidth(){
    return ScreenSizeHelper.getWidth() - (standardWidth * 4) - (standardPadding * 4);
  }
}
