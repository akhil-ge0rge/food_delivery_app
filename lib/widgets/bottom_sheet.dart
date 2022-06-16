import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/screens/payment_screen.dart';

import '../util/favList.dart';

class CoustomBottomSheet extends StatefulWidget {
  CoustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CoustomBottomSheet> createState() => _CoustomBottomSheetState();
}

var discount;
var shipping;

class _CoustomBottomSheetState extends State<CoustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var totalAmount = 0;
    var x;
    for (int i = 0; i < CartList.length; i++) {
      x = CartList[i]['price'] * CartList[i]['count'];
      totalAmount = x + totalAmount;
      setState(() {});
    }

    return Container(
      height: 375,
      width: double.infinity,
      color: Color(0xfffefeff),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            height: 4,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            // color: Colors.blue,
            height: 260,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Total",
                        style: TextStyle(
                            color: Color(0xff9d9c9c),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      Text(
                        "\$${totalAmount.toString()}",
                        style: TextStyle(
                            color: Color(0xff9d9c9c),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping",
                        style: TextStyle(
                            color: Color(0xff9d9c9c),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      Text(
                        "${totalAmount == 0 ? shipping = 0 : shipping = 3}",
                        style: TextStyle(
                            color: Color(0xff9d9c9c),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: TextStyle(
                            color: Color(0xff9d9c9c),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      Text(
                        "${totalAmount == 0 ? discount = 0 : discount = 1}",
                        style: TextStyle(
                            color: Color(0xff9d9c9c),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "- - - - - - - - - - - - - - - - - - - - - - - - - -",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 233, 233, 233),
                              fontSize: 20),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                color: Color(0xff9d9c9c),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          Text(
                            "\$${totalAmount - discount + shipping}",
                            style: TextStyle(
                                color: Color(0xfff9bc66),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.red,
            color: Color(0xfffefeff),
            height: 50,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${x = totalAmount - discount + shipping}",
                  style: TextStyle(
                      color: Color(0xff131212),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xff131212),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.5),
                        spreadRadius: .1,
                        blurRadius: 6,
                        offset: Offset(0, 4), // Shadow position
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => PaymentScreen(
                                    finalAmount: x,
                                    discount: discount,
                                  ))));
                    },
                    child: Text(
                      "Pay now",
                      style: TextStyle(
                          color: Color(0xffa2a2a3),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
        ],
      ),
    );
  }
}
