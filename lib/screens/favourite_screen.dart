import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/widgets/list_widget.dart';

import '../util/favList.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffefe),
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Container(
                //   // color: Colors.blue,
                //   margin: EdgeInsets.only(right: 80),
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.pop(context);
                //     },
                //     child: Icon(
                //       Icons.arrow_back_ios,
                //       size: 23,
                //     ),
                //   ),
                // ),
                Row(
                  children: [
                    Text(
                      "Favourites",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
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
          Container(
              margin: EdgeInsets.only(top: 15),
              height: 658,
              width: 360,
              color: Color(0xfffffefe),
              child: ListView.builder(
                itemCount: favList.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                        height: 110,
                        width: 360,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.2),
                              spreadRadius: .1,
                              blurRadius: 6,
                              offset: Offset(0, 4), // Shadow position
                            ),
                          ],
                          color: const Color(0xfffffefe),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 90,
                              width: 100,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.2),
                                      spreadRadius: .1,
                                      blurRadius: 6,
                                      offset: Offset(0, 4), // Shadow position
                                    ),
                                  ],
                                  color: const Color(0xfffffefe),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Image(
                                  image: AssetImage(
                                      favList[index]['img'].toString())),
                            ),
                            Container(
                              height: 50,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Text(
                                      favList[index]['title'].toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Text(
                                      "\$ " +
                                          favList[index]['price'].toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }),
              ))
        ]),
      ),
    );
  }
}
