import 'package:flutter/material.dart';
import 'package:food_delivery_app/util/favList.dart';

import '../widgets/bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

bool? isChecked = false;

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: CoustomBottomSheet(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "Cart",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        // color: Colors.blue,
                        margin: EdgeInsets.only(left: 80),
                        child: Icon(
                          Icons.more_horiz,
                          size: 25,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 640,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: CartList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 120,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Checkbox(
                              activeColor: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value;
                                  print(isChecked);
                                });
                              },
                            ),
                            Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                  color: Color(0xfffef5ea),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Image(
                                  height: 20,
                                  width: 20,
                                  image: AssetImage(CartList[index]['image'])),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Container(
                              height: 60,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    CartList[index]['title'],
                                    style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ),
                                  Text(
                                    "\$" +
                                        (CartList[index]['price'] *
                                                CartList[index]['count'])
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 75,
                              height: 50,
                              // color: Colors.blue,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (CartList[index]['count'] == 1) {
                                          CartList.removeAt(index);

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  margin: EdgeInsets.only(
                                                      left: 20,
                                                      bottom: 20,
                                                      right: 20),
                                                  dismissDirection:
                                                      DismissDirection
                                                          .horizontal,
                                                  content: Text("Item Removed"),
                                                  duration:
                                                      Duration(seconds: 1)));
                                        } else {
                                          CartList[index]['count']--;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Color(0xffeef1f0),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                          child: Icon(
                                        Icons.remove,
                                        size: 20,
                                      )),
                                    ),
                                  ),
                                  Text(
                                    CartList[index]['count'].toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        CartList[index]['count']++;
                                      });
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CoustomBottomSheet();
                });
          });
        },
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 175,
          decoration: BoxDecoration(
            color: Color(0xff141414),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            "Check Out",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
