import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(builder: (context) {
          return Stack(children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login.jpg'),
                    fit: BoxFit.fitHeight),
              ),
              // color: Colors.red,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    color: Colors.black.withOpacity(.3),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 8,
              left: MediaQuery.of(context).size.height / 6,
              child: Text(
                "BURGER\nQUEEN",
                style: TextStyle(
                  shadows: [
                    Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(.5)),
                  ],
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 4,
              left: MediaQuery.of(context).size.height / 20,
              child: Text(
                "Good Food\nTasty Food",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.orangeAccent,
                  decorationThickness: 2,
                  color: Colors.white,
                  fontSize: 27,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 8,
              left: MediaQuery.of(context).size.height / 25,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffff8c07),
                    borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.width / 7,
                child: Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      // decoration: TextDecoration.underline,
                      // decorationColor: Colors.orangeAccent,
                      // decorationThickness: 2,
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 12,
              left: MediaQuery.of(context).size.height / 10,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2),
                  ),
                ]),
              ),
            ),
          ]);
        }),
      ),
    );
  }
}
