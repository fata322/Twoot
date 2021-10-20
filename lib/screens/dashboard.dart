// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:twoot/recorder/twoots.dart';
import 'package:twoot/screens/create_twoot.dart';
import 'package:intl/intl.dart';

final String transactionDate = DateFormat("MM-dd-yy").format(DateTime.now());

/// This is the main application widget.
class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 1,
        title: Image.asset('assets/images/twoot.png'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(200)),
            child: Image.asset('assets/images/prof_pic.jpg'),
          ),
        ),
        actions: [
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Image.asset('assets/images/sparkle.png'),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Dashboard()));
            },
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Card(
            color: Color(0xff000000),
            child: userTwoots.isEmpty
                ? Center(
                    child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Twoot Pls?",
                      style: TextStyle(
                          fontSize: 26,
                          color: Color(0xffFFFFFF).withOpacity(0.2),
                          fontWeight: FontWeight.w600),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\nNo twoots\nfor the past 24 hours',
                          style: TextStyle(
                            color: Color(0xffFFFFFF).withOpacity(0.2),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ))
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: userTwoots.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffffffff).withOpacity(0.06)),
                            // ignore: duplicate_ignore
                            child: ListTile(
                              // ignore: prefer_const_constructors
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              leading: CircleAvatar(
                                backgroundColor: Color(0xffffffff),
                                radius: 20.0,
                                child: Icon(Icons.person,
                                    color: Color(0xff08A0E9)),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'You',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffffffff)),
                                      ),
                                      Text(
                                        ' @ChrisJohn',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffECDBBA)
                                                .withOpacity(0.2)),
                                      ),
                                      Text(
                                        " " + transactionDate,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffECDBBA)
                                                .withOpacity(0.2)),
                                      ),
                                    ]),
                              ),
                              subtitle: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: Text(userTwoots[index].twoot,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFFFFFFF)),
                                      textAlign: TextAlign.left),
                                ),
                              ),
                            )

                            // ignore: prefer_const_literals_to_create_immutables
                            ),
                      );
                    }),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/home.png"),
              // ignore: deprecated_member_use
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/search.png"),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/notif.png"),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/messages.png"),
              title: Text(""),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateTwoot()),
          );
        },
        child: Icon(Icons.auto_awesome, color: Color(0xffECDBBA)),
        backgroundColor: Color(0xff08A0E9),
        elevation: 3,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      backgroundColor: Color(0xff000000),
      extendBody: true,
    );
  }
}
          // insert floating action button here 
      
  

