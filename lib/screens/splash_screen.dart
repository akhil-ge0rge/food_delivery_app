// import 'dart:async';
// import 'package:food_delivery_app/screens/login_screen.dart';
// import 'package:food_delivery_app/screens/main_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:food_delivery_app/screens/signorlog.dart';

// var finalEmail;

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     getValidationData().whenComplete(() async {
//       Timer(Duration(seconds: 2), () {
//         if (finalEmail == null) {
//           Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => SignInOrLogInScreen(),
//               ));
//         } else {
//           Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => MainPage(),
//               ));
//         }
//       });
//     });
//   }

//   Future getValidationData() async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     var obtainedEmail = sharedPreferences.getString('email');
//     setState(() {
//       finalEmail = obtainedEmail;
//     });
//     print(finalEmail);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Center(
//           child: Text("Loading..."),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/main_page.dart';
import 'package:food_delivery_app/screens/signorlog.dart';

import 'package:shared_preferences/shared_preferences.dart';

var finalEmail;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getValidationData().whenComplete(() async {
      Timer(const Duration(seconds: 2), () {
        print("final : $finalEmail");

        if (finalEmail == null) {
          print("Hello");

          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return SignInOrLogInScreen();
            },
          ));
        } else {
          print("hi");

          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return SignInOrLogInScreen();
            },
          ));
        }
      });
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
    // print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset("assets/images/burgLoad.gif",
                    height: 250, width: 250)),
            // SizedBox(
            //   height: 30,
            // ),
            // Text("Loading..."),
            // SizedBox(
            //   height: 10,
            // ),
            // CircularProgressIndicator(
            //   color: Colors.orangeAccent,
            // )
          ],
        ),
      ),
    );
  }
}
