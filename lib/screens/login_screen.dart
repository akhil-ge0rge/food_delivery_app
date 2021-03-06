import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/screens/home_screen.dart';
import 'package:food_delivery_app/screens/main_page.dart';
import 'package:food_delivery_app/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  final TextEditingController emailController = TextEditingController();

  final FocusNode emailFocus = FocusNode();

  final TextEditingController passwordController = TextEditingController();

  final FocusNode passwordFocus = FocusNode();

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus!.unfocus();
            },
            child: Container(
              color: Color(0xfffff7e2),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.width / 1.3,
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Image.asset(
                      "assets/images/bike.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 8,
                  ),
                  Form(
                    key: loginKey,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 10,
                        right: MediaQuery.of(context).size.width / 10,
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            autofocus: false,
                            maxLines: 1,
                            focusNode: emailFocus,
                            controller: emailController,
                            validator: (email) {
                              const pattern =
                                  r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                              final regExp = RegExp(pattern);

                              if (email!.isEmpty) {
                                return 'Enter an email';
                              } else if (!regExp.hasMatch(email)) {
                                return 'Enter a valid email';
                              } else {
                                return null;
                              }
                            },
                            showCursor: false,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffeef0f1),
                                focusColor: Color(0xffeef0f1),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey[700],
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                                hintText: 'Email ID',
                                prefixIcon: Icon(
                                  Icons.alternate_email_outlined,
                                  color: Colors.black,
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (pass) {
                              RegExp regex = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                              if (pass!.isEmpty) {
                                return 'Please enter password';
                              } else if (pass.length < 6) {
                                return 'Password must contain atleast 6 characters';
                              } else {
                                if (!regex.hasMatch(pass)) {
                                  return 'Enter valid password';
                                } else {
                                  return null;
                                }
                              }
                            },
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            autofocus: false,
                            focusNode: passwordFocus,
                            controller: passwordController,
                            showCursor: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffeef0f1),
                              focusColor: Color(0xffeef0f1),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(35.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(35.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(35.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(35.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(35.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(35.0),
                              ),
                              hintStyle: TextStyle(
                                fontSize: 17,
                                color: Colors.grey[700],
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                              hintText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (loginKey.currentState!.validate()) {
                                print(emailController.value.text);
                                if (emailController.value.text ==
                                        "akhil@gmail.com" &&
                                    passwordController.value.text ==
                                        "Akhil@123") {
                                  final SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  sharedPreferences.setString(
                                      'email', emailController.value.text);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainPage(),
                                      ));
                                }
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 1.7,
                              height: MediaQuery.of(context).size.width / 6.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xfff9a01f),
                              ),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Don't have an account yet?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUpScreen(),
                                        ));
                                  },
                                text: "  Sign Up",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    decorationThickness: 2),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
