import 'package:app_progetto/models/cartList.dart';
import 'package:app_progetto/models/formInfo.dart';
import 'package:app_progetto/pages/advancedSearchPage.dart';
import 'package:app_progetto/pages/cartPage.dart';
import 'package:app_progetto/pages/homePage.dart';
import 'package:app_progetto/pages/purchasePage.dart';
import 'package:app_progetto/pages/resultPage.dart';
import 'package:app_progetto/pages/searchPage.dart';
import 'package:app_progetto/pages/shopPage.dart';
import 'package:app_progetto/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

//Widget radice della mia applicazione:
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(
        create: (context) => cartList()),
        ChangeNotifierProvider(
            create: (context) => FormInfo()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(), //Specifico qual è la mia pagina iniziale
        theme: lightMode,
        routes: {
          '/homePage':(context) => const HomePage(),
          '/shopPage':(context) => const ShopPage(),
          '/cartPage':(context) => const CartPage(),
          '/searchPage':(context) => SearchPage(),
          '/advancedSearch':(context) => AdvancedSearch(),
          '/purchasePage':(context) => PurchasePage(),
          '/resultPage':(context) => const ResultPage(),
        },
      ),
    );
  }
}
