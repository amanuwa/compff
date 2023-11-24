import 'dart:html';
import 'dart:math';

import 'package:companysinterface/choosepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:intl/intl.dart';

class cutter1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return cutter1widget();
  }
}

class cutter1widget extends State {
  final String Amanj = "qwerty";
  final String bus1 = "poiuyt";
  final String name = "qwerty";
  final String phone = "poiuyt";

  DateTime dat = DateTime.now();
  String fynaldat = "";
  final TextEditingController journydata = TextEditingController();
  final TextEditingController nam = TextEditingController();
  final TextEditingController fon = TextEditingController();
  ScrollController Amanscrol = ScrollController();
  static final curdat = DateTime.now();

  static final today = DateTime(curdat.day, curdat.month, curdat.year);

  static String td = DateFormat('EEEE').format(curdat);

  static final today1 = DateTime(curdat.year, curdat.month, curdat.day + 1);

  static String td1 = DateFormat('EEEE').format(today1);

  static final today2 = DateTime(curdat.year, curdat.month, curdat.day + 2);

  static String td2 = DateFormat('EEEE').format(today2);

  static final today3 = DateTime(curdat.year, curdat.month, curdat.day + 3);

  static String td3 = DateFormat('EEEE').format(today3);

  static final today4 = DateTime(curdat.year, curdat.month, curdat.day + 4);

  static String td4 = DateFormat('EEEE').format(today4);

  static final today5 = DateTime(curdat.year, curdat.month, curdat.day + 5);

  static String td5 = DateFormat('EEEE').format(today5);

  static final today6 = DateTime(curdat.year, curdat.month, curdat.day + 6);

  static String td6 = DateFormat('EEEE').format(today6);
  static final today7 = DateTime(curdat.year, curdat.month, curdat.day + 7);

  static String td7 = DateFormat('EEEE').format(today7);

  List<String> dys = ['Today', 'Tommorow', td2, td3, td4, td5, td6];
  static final List<String> tym = [
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '01:00',
    '01:30'
  ];
  var jornylist2 = [];
  var jornylist = [];
  var jornylist9 = [];
  var Selectedtym;

  static var isEnabled1 = false;
  static var isEnabled2 = false;
  static var isEnabled3 = false;
  static var isEnabled4 = false;
  static var isEnabled5 = false;
  static var isEnabled6 = false;
  static var isEnabled7 = false;
  static var isEnabled8 = false;
  static var isEnabled9 = false;
  static var isEnabled10 = false;
  var blist = [
    isEnabled1,
    isEnabled2,
    isEnabled3,
    isEnabled4,
    isEnabled5,
    isEnabled6,
    isEnabled7,
    isEnabled8,
    isEnabled9,
    isEnabled10

  ];

  var c1name;
  var c1starttime;
  var c1pryce;
  var c2name;
  var c2pryce;
   var c2starttime;
    var setnum2 = [];
  

  Alljourney() async {
    try {
      print("started");
      
      http.Response response = await http.post(
        Uri.parse('http://localhost:9000/users/Alljourney'),
        body: {"Journey": "diredewa", "general_id": "00", "journey_id": "67"},
      );

      var data = json.decode(response.body);
      var units = (json.decode(response.body) as Map<String, dynamic>);

      setState(() {
        jornylist = units["data"].toList();
        jornylist2 = jornylist;
        jornylist9 = jornylist;
      });
      print(jornylist);
    } on HttpException catch (e) {
      print(e.message);
      print("failed response");
    }
  }

  var basiclist = [];
  var setnum = [];
  static var rr = [];
  var cont = false;

  basicdata() async {
    setState(() {
       cont = false;
    });
    try {
      Map<String, dynamic> map9 = {
        "jornedata": fynaldat.toString().trim(),
      };

      var body = json.encode(map9);
      print(body);
      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};

      http.Response response = await http.post(
          Uri.parse('http://localhost:9000/users/carstat'),
          body: body,
          headers: headers,
          encoding: encoding);

      var data = json.decode(response.body);
    

      var units = (json.decode(response.body) as Map<String, dynamic>);

      setState(() async {
        basiclist = units["data"].toList();
        print(basiclist);
        print(basiclist[0]);
        print(basiclist[1]);
        print(basiclist.length);
        print(basiclist[0].length);

          
            for (var p = 0; p < basiclist.length; p++) {
       

                                setState((() {
                                   blist[p] =  true;
                                }));
                                   print( blist[p]);
                              }
        if(basiclist.length==1)
        {
          cont = true;
           c1name=basiclist[0][3];
           c1pryce=basiclist[0][10];
           setnum=basiclist[0][9];
           c1starttime=basiclist[0][2];
           print(cont);
            print(c1name);
             print(c1pryce);
              print(setnum);

        }
        else  if(basiclist.length==2)
        {
          cont = true;
           c1name=basiclist[0][3];
           c1pryce=basiclist[0][10];
           setnum=basiclist[0][9];
              c1starttime=basiclist[0][2];
           c2name=basiclist[1][3];
           c2pryce=basiclist[1][10];
           setnum2=basiclist[1][9];
           c2starttime=basiclist[1][2];
           print(cont);
             print(c1name);
             print(c1pryce);
              print(setnum);
            print(c2name);
             print(c2pryce);
              print(setnum2);

        }
       


        // basiclist.forEach((element) {
        //   rr.add('${element['carstatus']}');

        //   ///carlist = rr as List;
        // });
        // rr.length = basiclist.length;
        // carlist = rr;

        // if (basiclist.isNotEmpty) {
          
        // } else {
        //   cont = false;
        // }
        // print(carlist);

        //    for (var e = 0; e < carlist.length; e++) {
        //                       for (var p = 0; p < carlist.length; p++) {
        //                         blist[p] = true;
        //                       }
        //                     }
      });
    } on HttpException catch (e) {
      print(e.message);
    }
  }

  @override
  void initState() {
    super.initState();
    Alljourney();
  }

  var selecteddate = null;

  String? dropdownvalue;
  String? Startingposition;
  String? dropdownvalue1;
  String Selekteddate = " ";
  String mn = " ";
  var m = 0;
  var n = 0;
  int current = 100;
  String stod = " ";
  void check(value) {
    //print("index udefined $value");
    var temp = jornylist9
        .where((x) => jornylist9.indexOf(x) != jornylist9.indexOf(value))
        .toList();

    setState(() {
      jornylist2 = temp;
    });
  }

  void check1(value) {
    // print("index udefined 2 $value");
    var temp = jornylist9
        .where((x) => jornylist9.indexOf(x) != jornylist9.indexOf(value))
        .toList();

    setState(() {
      jornylist = temp;
    });
  }
//String journydata="qwerty";

  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;

      double height = MediaQuery.of(context).size.height;
    return LayoutBuilder(builder: (builder, constraints) {
      return Scaffold(
        body: Container(
          color: Colors.white,
          child: ListView(children: <Widget>[
            Expanded(
              child: LayoutBuilder(builder: (context, Constraints) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(12, 5, 10, 0),
                        height: 45,
                        width: 130,
                        color: Colors.white,
                        child: TextFormField(
                          controller: nam,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), hintText: "Name"),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(12, 5, 10, 5),
                        height: 45,
                        width: 135,
                        color: Colors.white,
                        child: TextFormField(
                          controller: fon,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), hintText: "phone"),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Row(
                  children: <Widget>[
                    Container(
                        width: 140,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
                          width: 285,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: Color.fromARGB(164, 0, 0, 0)),
                            color: Colors.white,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              items: jornylist
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              hint: Text("Starting"),
                              value: dropdownvalue,
                              onChanged: (value) {
                                setState(() {
                                  dropdownvalue = value.toString();
                                  Startingposition = dropdownvalue.toString();

                                  check(value.toString());
                                });
                                validator:
                                (value) =>
                                    value == null ? 'field required' : null;
                              },
                              icon: const Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )),
                    Container(
                        width: 25,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                          child: Text(
                            'to',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        )),
                    Container(
                        width: 140,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                          width: 300,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: Color.fromARGB(164, 0, 0, 0)),
                            color: Colors.white,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              items: jornylist2
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              hint: Text("destination"),
                              value: dropdownvalue1,
                              onChanged: (value) {
                                setState(() {
                                  dropdownvalue1 = value.toString();

                                  check1(value.toString());
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )),
                  ],
                );
              }),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 20,
                    ),


                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 7,
                    ),

                    Flexible(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 20, 5, 2),
                        //  width: double.infinity
                        width: 635,
                        color: Color.fromRGBO(0, 0, 0, 0.122),
                        child: SizedBox(
                          height: 35,
                          width: double.infinity,
                          child: Container(
                              child: Scrollbar(
                            interactive: true,
                            trackVisibility: true,
                            thumbVisibility: true,
                            child: ListView.builder(
                              itemCount: dys.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selecteddate = dys[index].toString();
                                      current = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    margin: EdgeInsets.fromLTRB(5, 1, 5, 1),
                                    width: 79,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: current == index
                                            ? Colors.white
                                            : Colors.white54,
                                        borderRadius: current == index
                                            ? BorderRadius.circular(15)
                                            : BorderRadius.circular(10),
                                        // BorderRadius.circular(10),
                                        border: current == index
                                            ? Border.all(
                                                color: Colors.red, width: 3)
                                            : null),
                                    duration: const Duration(milliseconds: 300),
                                    child: Center(
                                      child: Text(dys[index]),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),

            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 20,
                    ),

                    // Container(
                    //     child: Container(
                    //   margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(8),
                    //     border: Border.all(color: Color.fromARGB(164, 0, 0, 0)),
                    //     color: Colors.white,
                    //   ),
                    //   child: DropdownButtonHideUnderline(
                    //     child: DropdownButton<String>(
                    //       items: tym
                    //           .map((item) => DropdownMenuItem<String>(
                    //                 value: item,
                    //                 child: Text(
                    //                   item,
                    //                   style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 15,
                    //                   ),
                    //                 ),
                    //               ))
                    //           .toList(),
                    //       hint: Text("time"),
                    //       value: Selectedtym,
                    //       onChanged: (value) {
                    //         setState(() {
                    //           Selectedtym = value.toString();
                    //         });
                    //       },
                    //       icon: const Icon(
                    //         Icons.arrow_drop_down_circle_outlined,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ),
                    // )),
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Color.fromARGB(164, 0, 0, 0)),
                          color: Colors.white,
                        ),
                        //margin: EdgeInsets.fromLTRB(3, 5, 3, 2),
                        child: TextField(
                          controller: journydata,
                          readOnly: true,
                          decoration: InputDecoration(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    Flexible(
                        child: Container(
                      margin: EdgeInsets.fromLTRB(3, 5, 3, 2),
                      child: ElevatedButton(
                        onPressed: () async {
                         
                          
                            // for( var w=0; w< 10; w++)
                            // {
                            //   blist[w]=false;
                            // }
                          
                         setState(() {
                            Writedata();
                           basicdata();
                         });
                          
                          
                        
                        },
                        child: const Text(" check"),
                      ),
                    )),
                  ],
                );
              }),
            ),



////////////////////////////////////////////            
           Flexible(
              child: (cont)
                  ? Column(
                      children: <Widget>[
                        Container(
                            child: (blist[0])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        c1name,
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin:const  EdgeInsets.only(left:3),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          'starting time')),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          c1starttime,style: TextStyle(fontWeight: FontWeight.bold),)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child:
                                                        Text('0')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      c1pryce,
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => Chossepage(
                                                              Amanj: journydata
                                                                  .text,
                                                              bus1: "bus1",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                                      selecteddate:selecteddate,
                                                              jprice:
                                                                  'carprice',
                                                                
                                                                  )));
                                                },
                                                child: Text(('choose') +
                                                    ('Bus1'))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),

                        ///bus2
                        Container(
                            child: (blist[1])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                       c2name,
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin:const  EdgeInsets.only(left:3),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                ),
                                                    Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          'starting time')),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          c2starttime,style: TextStyle(fontWeight: FontWeight.bold),)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      c2pryce,
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => Chossepage(
                                                              Amanj: journydata
                                                                  .text,
                                                              bus1: "bus2",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  'carprice',
                                                                   selecteddate: selecteddate,)));
                                                },
                                                child: Text(('choose') +
                                                    ('Bus2'))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),

                        ///bus3
                        Container(
                            child: (blist[2])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus3',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      'carprice',
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => Chossepage(
                                                              Amanj: journydata
                                                                  .text,
                                                              bus1: "bus3",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                                      selecteddate: selecteddate,
                                                              jprice:
                                                                  'carprice')));
                                                },
                                                child: Text(('choose') +
                                                    ('Bus3'))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),
                        ////bus4
                        Container(
                            child: (blist[3])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus4',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      'carprice',
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => Chossepage(
                                                              Amanj: journydata
                                                                  .text,
                                                                  selecteddate: selecteddate,
                                                              bus1: "bus4",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  'carprice')));
                                                },
                                                child: Text(('choose') +
                                                    ('Bus4'))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),

                        // bus5
                        Container(
                            child: (blist[4])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus5',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      'carprice',
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => Chossepage(
                                                              Amanj: journydata
                                                                  .text,
                                                                  selecteddate: selecteddate,
                                                              bus1: "bus5",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  'carprice')));
                                                },
                                                child: Text(('choose') +
                                                    ('Bus5'))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),
                        //bus6
                        Container(
                            child: (blist[5])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus6',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      'carprice',
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => Chossepage(
                                                              Amanj: journydata
                                                                  .text,
                                                                  selecteddate: selecteddate,
                                                              bus1: "bus6",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  'carprice')));
                                                },
                                                child: Text(('choose') +
                                                    ('Bus6'))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),

                        ///bus7
                        Container(
                            child: (blist[6])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus7',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      'carprice',
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => Chossepage(
                                                              Amanj: journydata
                                                                  .text,
                                                              bus1: "bus7",
                                                              name: nam.text,
                                                              selecteddate: selecteddate,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  'carprice')));
                                                },
                                                child: Text(('choose') +
                                                    ('Bus7'))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),

                        ////bus8
                        Container(
                            child: (blist[7])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus8',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      'carprice',
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => Chossepage(
                                                              Amanj: journydata
                                                                  .text,
                                                                  selecteddate: selecteddate,
                                                              bus1: "bus8",
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  'carprice')));
                                                },
                                                child: Text(('choose') +
                                                    ('Bus8'))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),

                        ///bus9
                        Container(
                            child: (blist[8])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus9',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      'carprice',
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => Chossepage(
                                                              Amanj: journydata
                                                                  .text,
                                                              bus1: "bus9",
                                                              selecteddate: selecteddate,
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  'carprice')));
                                                },
                                                child: Text(('choose') +
                                                    ('Bus9'))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),

                        ///bus10
                        Container(
                            child: (blist[9])
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [BoxShadow(blurRadius: 2)]),
                                    width: width * 0.75,
                                    height: 85,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      width: 100,
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                        'Bus10',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          left: 2),
                                                      child: Text(
                                                        '$dropdownvalue',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      width: 45,
                                                      child: Text(
                                                        'to',
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.all(5),
                                                      child: Text(
                                                          '$dropdownvalue1')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text(
                                                      'AvailableSeat',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text('52')),
                                                Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Text('price'),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                    // ignore: avoid_function_literals_in_foreach_calls
                                                    child: Text(
                                                      'carprice',
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) => Chossepage(
                                                              Amanj: journydata
                                                                  .text,
                                                              bus1: "bus10",
                                                              selecteddate: selecteddate,
                                                              name: nam.text,
                                                              phone: fon.text,
                                                              startingplace:
                                                                  dropdownvalue
                                                                      .toString(),
                                                              destinationplace:
                                                                  dropdownvalue1
                                                                      .toString(),
                                                              jprice:
                                                                  'carprice')));
                                                },
                                                child: Text(('choose') +
                                                    ('Bus10'))),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                : null),
                      ],
                    )
                  : Container(),
            )



////////////////////////////////////////////////////            
          ]),
        ),
      );
    });
  }

  void Writedata() {
    if (selecteddate == ('Today')) {
      setState(() {
        selecteddate = '${curdat.day}/${curdat.month}/${curdat.year}';
        //today
      });
    }
    if (selecteddate == ('Tommorow')) {
      setState(() {
        selecteddate = '${today1.day}/${today1.month}/${today1.year}';
        //today
      });
    }
    if (selecteddate == (td2)) {
      setState(() {
        selecteddate = '${today2.day}/${today2.month}/${today2.year}';
        //today
      });
    }
    if (selecteddate == (td3)) {
      setState(() {
        selecteddate = '${today3.day}/${today3.month}/${today3.year}';
        //today
      });
    }
    if (selecteddate == (td4)) {
      setState(() {
        selecteddate = '${today4.day}/${today4.month}/${today4.year}';
        //today
      });
    }
    if (selecteddate == (td5)) {
      setState(() {
        selecteddate = '${today5.day}/${today5.month}/${today5.year}';
        //today
      });
    }
    if (selecteddate == (td6)) {
      setState(() {
        selecteddate = '${today6.day}/${today6.month}/${today6.year}';
        //today
      });
    }
    if (selecteddate == (td7)) {
      setState(() {
        selecteddate = '${today7.day}/${today7.month}/${today7.year}';
        //today
      });
    }

    if (dat == curdat && selecteddate != null) {
      journydata.text = ("$Startingposition" +
          " " +
          'to' +
          " " +
          "$dropdownvalue1" +
          " " +
          '$selecteddate');
    } else if (selecteddate != null &&
        (dat.day) == (curdat.day) &&
        (dat.month) == (curdat.month) &&
        (dat.year) == (curdat.year)) {
      journydata.text = ('$Startingposition' +
          " " +
          'to' +
          " " +
          '$dropdownvalue1' +
          " " +
          '$selecteddate' 
        
         );
    } else if (selecteddate != null &&
        (((dat.day) != (curdat.day)) ||
            ((dat.month) != (curdat.month)) ||
            ((dat.year) != (curdat.year)))) {
      journydata.text = ('$Startingposition' +
          " " +
          'to' +
          " " +
          '$dropdownvalue1' +
          " " +
          '${dat.day}/${dat.month}/${dat.year}' );
    }
  
    setState(() {
      fynaldat = journydata.text;
      print(fynaldat);
      Selekteddate = ('${dat.day}/${dat.month}/${dat.year}');
      stod = ('$Startingposition' + " " + 'to' + " " + '$dropdownvalue1')
          .toString();
         
    });
  
  }
}
