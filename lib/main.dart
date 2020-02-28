import 'package:delivery_flutter_app/screeens/screen_basket.dart';
import 'package:delivery_flutter_app/screeens/screen_basket_details.dart';
import 'package:delivery_flutter_app/screeens/screen_basket_success.dart';
import 'package:delivery_flutter_app/screeens/screen_categories.dart';
import 'package:delivery_flutter_app/screeens/screen_contacts.dart';
import 'package:delivery_flutter_app/screeens/screen_historys.dart';
import 'package:delivery_flutter_app/screeens/screen_offers.dart';
import 'package:delivery_flutter_app/screeens/screen_products.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => CategoriesScreen(),
        '/screen_products': (context) => ScreenProducts(),
        '/screen_busket': (context) => BasketScreen(),
        '/screen_busket_detailed': (context) => BasketDetailsScreen(),
        '/screen_busket_success': (context) => BasketSuccessScreen(),
        '/screen_offers': (context) => OffersScreen(),
        '/screen_history': (context) => HistoryScreen(),
        '/screen_contacts': (context) => ContactsScreen(),
      },
      initialRoute: '/',
    );
  }
}

