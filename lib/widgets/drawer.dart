import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DraweWid extends StatelessWidget {
  const DraweWid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 3, bottom: 3),
      child: Drawer(
        width: 200,
        backgroundColor: Colors.blueGrey[100],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        elevation: 0,
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Home",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: .1,
                      blurRadius: 6,
                      offset: Offset(0, 4), // Shadow position
                    ),
                  ],
                  color: Color(0xff131313),
                  borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.center,
              height: 50,
              width: 50,
              margin: EdgeInsets.all(20),
              child: Text(
                "Cart",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: .1,
                      blurRadius: 6,
                      offset: Offset(0, 4), // Shadow position
                    ),
                  ],
                  color: Color(0xff131313),
                  borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.center,
              height: 50,
              width: 50,
              margin: EdgeInsets.all(20),
              child: Text(
                "Favourites",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: .1,
                      blurRadius: 6,
                      offset: Offset(0, 4), // Shadow position
                    ),
                  ],
                  color: Color(0xff131313),
                  borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.center,
              height: 50,
              width: 50,
              margin: EdgeInsets.all(20),
              child: Text(
                "Page",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
