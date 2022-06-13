import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CoustomBottomSheet extends StatefulWidget {
  CoustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CoustomBottomSheet> createState() => _CoustomBottomSheetState();
}

class _CoustomBottomSheetState extends State<CoustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375,
      width: double.infinity,
      color: Color(0xfffefeff),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
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
            height: 100,
          ),
          Container(
            color: Colors.blue,
            height: 250,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Sub Total"), Text("\$24,90")],
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
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "\$0",
                        style: TextStyle(
                            color: Color(0xff9d9c9c),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500),
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
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "\$0",
                        style: TextStyle(
                            color: Color(0xff9d9c9c),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "---------------------------",
                        style:
                            TextStyle(color: Color(0xffd8d9db), fontSize: 40),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
