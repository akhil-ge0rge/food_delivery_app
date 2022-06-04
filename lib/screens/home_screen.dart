import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/item_details.dart';

import 'package:food_delivery_app/widgets/elevated_button.dart';
import 'package:food_delivery_app/widgets/list_widget.dart';

import '../util/data_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: const Color(0xfffffef),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Colors.grey,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.description_outlined,
              color: Colors.grey,
            ),
            label: "",
          ),
        ],
      ),
      backgroundColor: const Color(0xfffffefe),
      body: Container(
        padding: const EdgeInsets.only(
          left: 25,
          top: 25,
          right: 25,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(left: 25, top: 25),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xfffffefe),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Icon(Icons.menu),
                    ),
                    Positioned(
                      right: 1,
                      top: 5,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xfff35239),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  // margin: const EdgeInsets.only(right: 25, top: 25),
                  child: const CircleAvatar(
                    backgroundColor: Color(0xfffcf6ed),
                    radius: 25,
                    child: Image(
                      height: 35,
                      width: 35,
                      image: AssetImage("assets/images/face.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Find and order",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "burger for you 🍔",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              width: 500,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xfff8f8f8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey.withOpacity(.5),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: TextFormField(
                      showCursor: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Find your burger",
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(.5),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevButton(image: "assets/images/meat.png", title: "Beef"),
                  SizedBox(
                    width: 10,
                  ),
                  ElevButton(
                      image: "assets/images/cheese.png", title: "Cheese"),
                  SizedBox(
                    width: 10,
                  ),
                  ElevButton(
                      image: "assets/images/shrimp.png", title: "Shrimp"),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              "Most Popular",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 290,
              width: 500,
              // color: Colors.amberAccent,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: dataList.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemDetails(
                              ind: index,
                              image: dataList[index]['image'],
                              price: dataList[index]['price'],
                              rating: dataList[index]['rating'],
                              title: dataList[index]['title'],
                              desc: dataList[index]['desc'],
                            ),
                          ));
                    },
                    child: ListWid(
                        image: dataList[index]['image'],
                        title: dataList[index]['title'],
                        rating: "${dataList[index]['rating'].toString()}",
                        km: dataList[index]['km'].toString(),
                        price: dataList[index]['price'].toString()),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
