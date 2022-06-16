import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/widgets/pay_bottom_sheet.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key, required this.finalAmount, required this.discount})
      : super(key: key);
  var finalAmount;
  var discount;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 15, left: 20, right: 15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                  ),
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
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Address",
                  style: TextStyle(
                    color: Color(0xff3d3d3c),
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Change",
                  style: TextStyle(
                    color: Color(0xfff7c07d),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 110,
            width: 320,
            decoration: BoxDecoration(
                color: Color(0xfffffefe),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  height: 90,
                  width: 85,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/map.jpg')),
                      borderRadius: BorderRadius.circular(15)),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 5, top: 15, bottom: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Home",
                        style: TextStyle(
                          color: Color(0xff3d3d3c),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "JiHAli 37, Surabaya,East Java",
                        style: TextStyle(
                          color: Color(0xffe4e5e5),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "12410 •62 8020 000 2222",
                        style: TextStyle(
                          color: Color(0xffe4e5e5),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Payment Method",
              style: TextStyle(
                color: Color(0xff3d3d3c),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 60,
            width: 300,
            // color: Colors.black,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    height: 20,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      'assets/images/paypal.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  height: 50,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Color(0xfff1f1f1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/images/gpay.png'),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  height: 50,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Color(0xfff1f1f1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/images/mastercard.png'),
                ),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return PayBottomSheet(
                      discount: widget.discount,
                      finalAmount: widget.finalAmount);
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
            "Pay",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
