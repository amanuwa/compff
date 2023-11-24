import 'package:companysinterface/jorny.dart';
import 'package:flutter/material.dart';
import 'package:companysinterface/check.dart';
import 'package:companysinterface/contact.dart';
import 'package:companysinterface/cutter1.dart';
import 'package:companysinterface/findcar.dart';
import 'package:companysinterface/uploadpage.dart';
import 'package:companysinterface/helpvideo.dart';
import 'package:companysinterface/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Sign_in_page.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // throw UnimplementedError();
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              ' THE COMPANY INTERFACE',
              style: (TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              )),
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.clear();
                  prefs.commit();
                  await Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => sign_in_page()),
                      (Route<dynamic> route) => false);
                },
                child: Text('log out'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black54,
                ),
              )
            ],
            backgroundColor: Colors.black54,
            bottom:
                TabBar(indicatorColor: Colors.lightGreenAccent, tabs: <Widget>[
              Tab(
                text: "cutter",
                icon: Icon(Icons.check_box_outline_blank),
              ),
              Tab(
                text: "jorny",
                icon: Icon(Icons.fact_check_rounded),
              ),
              Tab(
                text: "find car",
                icon: Icon(Icons.directions_bus_sharp),
              ),
              Tab(
                text: "prejourney",
               
              ),
              Tab(
                text: "upload files",
                icon: Icon(Icons.upload),
              ),
              Tab(
                text: "language",
                icon: Icon(Icons.language_outlined),
              ),
              Tab(
                text: "contact",
                icon: Icon(Icons.phone),
              ),
            ]),
          ),
          body: TabBarView(children: <Widget>[
            cutter1(),
            jorny(),
            FindCar(),
            HelpVideo(),
            uploadpage(),
            Language(),
            Contact(),
          ]),
          drawer: Drawer(),
        ));
  }
  //Widget build
}
//MyAppState