import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'favourite_screen.dart';
import 'home_screen.dart';
import 'page_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

int navBarIndex = 0;
final _pages = [HomeScreen(), CartScreen(), FavouriteScreen(), PageScreen()];

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navBarIndex,
            selectedItemColor: Colors.grey,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: IconThemeData(size: 25),
            unselectedIconTheme: IconThemeData(size: 20),
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: const Color(0xfffffef),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.description_outlined,
                ),
                label: "",
              ),
            ],
            onTap: (index) {
              setState(() {
                if (index != navBarIndex) {
                  navBarIndex = index;
                }
              });
            },
          ),
          body: _pages[navBarIndex],
        ),
      ),
    );
  }
}
