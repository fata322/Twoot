// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twoot/screens/dashboard.dart';



class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            constraints: BoxConstraints.tight(MediaQuery.of(context).size),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 20,
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Image(image: AssetImage('assets/images/Twoot_login.png')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Happening\nNow!\nJoin Twoot today ",
                        style:
                            TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold,
                            ),
                            
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Form(
                      key: formGlobalKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) => value == "admin" ? null : '',
                            style: TextStyle(
                                color: Color(0xffECDBBA),
                                fontWeight: FontWeight.w100),
                            decoration: InputDecoration(
                                errorStyle: TextStyle(height: 0),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                filled: true,
                                fillColor: Color(0xff000000),
                                focusColor: Color(0xffffffff),
                                hintText: 'Phone, email, or username',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  color: Color(0xffECDBBA).withOpacity(0.5),
                                )),
                            obscureText: false,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          TextFormField(
                            validator: (value) => value == "admin" ? null : '',
                            style: TextStyle(
                                color: Color(0xffECDBBA),
                                fontWeight: FontWeight.w100),
                            decoration: InputDecoration(
                                errorStyle: TextStyle(height: 0),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                filled: true,
                                fillColor: Color(0xff000000),
                                focusColor: Color(0xffffffff),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  color: Color(0xffECDBBA).withOpacity(0.5),
                                )),
                            obscureText: true,
                          ),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: RichText(
                        text: TextSpan(
                          text: "New to twoot?",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffECDBBA),
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                                text: '\nSign Up Here',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => print('Under Construction')),
                          ],
                        ),
                      )),
                      Container(
                        width: 140,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formGlobalKey.currentState!.validate()) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Invalid Credentials')));
                              }
                            },
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.blue[400]),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(15)),
                                elevation: MaterialStateProperty.all(0))),
                      ),
                    ],
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