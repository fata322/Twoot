import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:twoot/screens/dashboard.dart';
import 'package:twoot/models/twoots.dart';

final twootText = TextEditingController();
void clearText() {
  twootText.clear();
}

class CreateTwoot extends StatefulWidget {
  const CreateTwoot({Key? key}) : super(key: key);

  @override
  State<CreateTwoot> createState() => _CreateTwootState();
}

class _CreateTwootState extends State<CreateTwoot> {
  String _enteredText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: TextField(
          controller: twootText,
          maxLength: 240,
          
          onChanged: (value) {
            setState(() {
              _enteredText = value;
            });
          },
          cursorColor: Color(0xff08a0e9),
          maxLines: null,
          style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.w300,
              fontSize: 18),
          decoration: InputDecoration(
              counterText: '',
              border: InputBorder.none,
              filled: true,
              fillColor: Color(0xff000000),
              focusColor: Color(0xffffffff),
              hintText: "What's happening?",
              
              hintStyle: TextStyle(
                fontWeight: FontWeight.w200,
                color: Color(0xffffffff).withOpacity(0.5),
              )),
        ),
      )),
      backgroundColor: Color(0x000000),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Color(0xff000000),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                  text: TextSpan(
                      text: 'Cancel',
                      style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff08a0e9)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard())))),