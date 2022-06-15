import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key, required this.finalAmount}) : super(key: key);
  var finalAmount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 15, left: 20, right: 15),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                ),
                SizedBox(
                  width: 80,
                ),
                Text(
                  "Payment",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
