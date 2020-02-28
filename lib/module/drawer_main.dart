import 'package:delivery_flutter_app/helper/screen_size_helper.dart';
import 'package:delivery_flutter_app/helper/text_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerMain extends StatefulWidget {
  @override
  _DrawerMainState createState() => _DrawerMainState();
}

class _DrawerMainState extends State<DrawerMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSizeHelper.getWidth() / 7 * 5,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: ScreenSizeHelper.getHeight() / 20 * 6,
              child: DrawerHeader(
                child: Column(
                  children: <Widget>[
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
                    TextWidgetHelper.getStyledText('Your logo', fontWeight: FontWeight.w400, textAlign: TextAlign.start, fontSize: 24),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: ScreenSizeHelper.getHeight() / 20 * 7.5,
                child: GridView.count(
                  padding: const EdgeInsets.all(0.0),
                  crossAxisCount: 3,
                  children: new List<Widget>.generate(9, (index) {
                    return new GridTile(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: new Card(
                            color: Colors.blue.shade200,
                            child: new Center(
                              child: new Text('tile $index'),
                            )),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Divider(),
            Container(
              height: ScreenSizeHelper.getHeight() / 20 * 4,
              child: Column(
                children: <Widget>[
                  InkWell(onTap: (){
                    Navigator.pushNamed(context, '/screen_offers');
                    }, child: drawerLineTextWidget('Акции',Icons.disc_full)),
                  InkWell(onTap: (){
                    Navigator.pushNamed(context, '/screen_history');
                  },child: drawerLineTextWidget('История заказов', Icons.history)),
                  drawerLineTextWidget('Оплата и доставка', Icons.attach_money),
                  InkWell(onTap:(){
                    Navigator.pushNamed(context, '/screen_contacts');
                  },child: drawerLineTextWidget('Контакты', Icons.phone)),
                  drawerLineTextWidget('Дисконтная карта', Icons.credit_card),
                ],
              ),
            ),
            Container(
              height: ScreenSizeHelper.getHeight() / 20*3.5,
              child: Column(
                children: <Widget>[
                  TextWidgetHelper.getStyledText('Мы в соц. сетях', fontWeight: FontWeight.w500, textAlign: TextAlign.start, fontSize: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.face, size: 20,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.opacity, size: 20,),
                      ),
                    ],
                  ),
                  TextWidgetHelper.getStyledText('Политика конфеденциальности', fontWeight: FontWeight.w500, textAlign: TextAlign.start, fontSize: 14),
                ],
            ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerLineTextWidget(text, icon){
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(icon, size: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextWidgetHelper.getStyledText(text, fontWeight: FontWeight.w500, textAlign: TextAlign.start, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
