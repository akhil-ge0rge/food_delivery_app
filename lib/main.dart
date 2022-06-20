import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/favourite_screen.dart';
import 'package:food_delivery_app/screens/home_screen.dart';
import 'package:food_delivery_app/screens/item_details.dart';
import 'package:food_delivery_app/screens/signorlog.dart';
import 'package:food_delivery_app/screens/main_page.dart';
import 'package:food_delivery_app/screens/splash_screen.dart';

import 'screens/cart_screen.dart';
import 'screens/page_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
