import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class uploadpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return uploadpageWidget();
  }
}

class uploadpageWidget extends State {
  DateTime dat = DateTime.now();
  String fynaldat = "";
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

  List<String> dys = ['Today', 'Tommorow', td2, td3, td4, td5, td6, td7];

  static final List<String> tym = [
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '01:00',
    '01:30'
  ];

  String value = tym.first;

  final TextEditingController Journey = TextEditingController();
  final TextEditingController general_id = TextEditingController();
  final TextEditingController journey_id = TextEditingController();
  final TextEditingController journydata = TextEditingController();

  final TextEditingController car1 = TextEditingController();
  final TextEditingController car1_platnum = TextEditingController();
  final TextEditingController car1_sidenum = TextEditingController();
  final TextEditingController car1_drivernum = TextEditingController();
  final TextEditingController car1_Assistantnum = TextEditingController();
  final TextEditingController car1_carstatus = TextEditingController();
  final TextEditingController seatcontrol = TextEditingController();
  final TextEditingController car1_price = TextEditingController();
  final Formkey1 = GlobalKey<FormState>();

  void Addjourney() async {
    try {
      Map<String, dynamic> map1 = {
        "Journey": Journey.text.toString().trim(),
        "general_id": general_id.text.toString().trim(),
        "journey_id": journey_id.text.toString().trim(),
      };
      print(map1);

      var body = json.encode(map1);
      print(body);
      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};

      final response = await http.post(
        Uri.parse('http://localhost:9000/users/ADDj'),
        headers: headers,
        body: body,
        encoding: encoding,
      );

      if (response.statusCode != 200) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Not  successfully'),
            content: Text(' Journey exists or\n and Journey_id exists\n '),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('ok')),
            ],
          ),
        );
      } else {
        // print(response.body);

        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Journey Added successfully'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('ok')),
            ],
          ),
        );
      }
    } catch (error) {}
  }

  // Map<String, dynamic> map9 = {
  //       "jornedata": fynaldat.toString().trim(),
  //     };

  //     var body = json.encode(map9);
  //     var encoding = Encoding.getByName('utf-8');
  //     const headers = {"Content-Type": "application/json"};

  //     http.Response response = await http.post(
  //         Uri.parse('http://localhost:9000/users/carstat'),
  //         body: body,
  //         headers: headers,
  //         encoding: encoding);

  //     var data = json.decode(response.body);
  var setnum = [
    ["0"]
  ];

  Future<void> uploadjourney() async {
    print('hi');
    print(fynaldat);
    try {
      Map<String, dynamic> mapj = {
        "jornedata": fynaldat.toString().trim(),
        "time": Selectedtym.toString().trim(),
        "car": car1.text.toString().trim(),
        "platnum": car1_platnum.text.toString().trim(),
        "sidenum": car1_sidenum.text.toString().trim(),
        "drivernum": car1_drivernum.text.toString().trim(),
        "assisnum": car1_Assistantnum.text.toString().trim(),
        "seatnumcol": setnum,
        "carstatus": car1_carstatus.text.toString().trim(),
        "price": car1_price.text.toString().trim(),
      };
      print(mapj);
      var body = json.encode(mapj);
      print(body);
      var encoding = Encoding.getByName('utf-8');
      var headers = {"Content-Type": "application/json"};
// headers: {"Content-Type": "application/json"},
      final response = await http.post(
          Uri.parse('http://localhost:9000/users/jornydatas'),
          body: body,
          headers: headers,
          encoding: encoding);
      print(response);

      if (response.statusCode != 200) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Not  successfully'),
            content: Text(' Journey exists '),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('ok')),
            ],
          ),
        );
      } else {
        // print(response.body);

        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Journey Added successfully'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('ok')),
            ],
          ),
        );
      }
    } catch (error) {}
  }

  void Removejourney() async {
    try {
      Map<String, dynamic> map1 = {
        "Journey": Journey.text.toString().trim(),
        "general_id": general_id.text.toString().trim(),
        "journey_id": journey_id.text.toString().trim(),
      };

      var body = json.encode(map1);

      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};

      final response = await http.post(
        Uri.parse('http://localhost:9000/users/Removej'),
        headers: headers,
        body: body,
        encoding: encoding,
      );

      if (response.statusCode != 200) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Not  successfully'),
            content: Text(
                ' Journey  does not exists or\n and Journey_does not exists\n '),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('ok')),
            ],
          ),
        );
      } else {
        print(response.body);

        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Journey Removed successfully'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('ok')),
            ],
          ),
        );
      }
    } catch (error) {}
  }

  var jornylist2 = [];
  var jornylist = [];
  var jornylist9 = [];
  var Selectedtym;
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
  var carlist = [];
  basicdata() async {
    try {
      Map<String, dynamic> map9 = {
        "jornedata": fynaldat.toString().trim(),
      };

      var body = json.encode(map9);
      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};

      http.Response response = await http.post(
          Uri.parse('http://localhost:9000/users/carstat'),
          body: body,
          headers: headers,
          encoding: encoding);

      var data = json.decode(response.body);

      var units = (json.decode(response.body) as Map<String, dynamic>);

      setState(() {
        basiclist = units["data"].toList();
        basiclist.forEach((element) {
          var rr = ('${element['carstatus']}');
          carlist = rr as List;
          print(rr);
        });
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

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          //margin: EdgeInsets.fromLTRB(5,5, 5, 2),
          color: Color.fromARGB(255, 178, 173, 173),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Form(
                        key: Formkey1,
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 70,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
                                  color: Colors.white,
                                  child: Text(
                                    'Journey :',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                            Container(
                                width: 140,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
                                  width: 285,
                                  decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Color.fromARGB(164, 0, 0, 0)),
                                    color: Colors.white,
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      items: jornylist
                                          .map((item) =>
                                              DropdownMenuItem<String>(
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
                                          Startingposition =
                                              dropdownvalue.toString();

                                          check(value.toString());
                                        });
                                        validator:
                                        (value) => value == null
                                            ? 'field required'
                                            : null;
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
                                    border: Border.all(
                                        color: Color.fromARGB(164, 0, 0, 0)),
                                    color: Colors.white,
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      items: jornylist2
                                          .map((item) =>
                                              DropdownMenuItem<String>(
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
                            Container(
                                width: 135,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
                                  color: Colors.white,
                                  child: Text('Add/Remove journey'),
                                )),
                            //                    Container(
                            //   height: 55,
                            //   width: 500,
                            //   child: TextFormField(
                            //     controller: usernamecontrol,
                            //     validator: (value) {
                            //       if (value!.isEmpty ||
                            //           !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            //         return ' please enter  the correct user name ';
                            //       }
                            //       {
                            //         return null;
                            //       }
                            //     },
                            //     style: TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 15,
                            //     ),
                            //     decoration: InputDecoration(
                            //         border: OutlineInputBorder(), hintText: "First name"),
                            //   ),
                            // ),
                            Container(
                              width: 250,
                              //margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                              color: Colors.white,
                              child: TextFormField(
                                controller: Journey,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please journey ';
                                  } else {}
                                },
                                style: TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.bold,
                                ),
                                //maxLines: 2,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "write journey"),
                              ),
                            ),
                            Container(
                              width: 75,
                              margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
                              color: Colors.white,
                              child: TextFormField(
                                controller: general_id,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please general_id ';
                                  } else {}
                                },
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "general_id"),
                              ),
                            ),
                            Container(
                              width: 85,
                              height: 30,
                              margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
                              color: Colors.white,
                              child: TextFormField(
                                controller: journey_id,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ' ';
                                  } else {}
                                },
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "journey_id"),
                              ),
                            ),
                            Container(
                                width: 100,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
                                  child: ElevatedButton.icon(
                                    onPressed: () async {
                                      if (Formkey1.currentState!.validate()) {
                                        Addjourney();
                                      }
                                    },
                                    label: const Text("Add"),
                                    icon: Icon(Icons.add),
                                  ),
                                )),
                            Container(
                                width: 120,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
                                  child: ElevatedButton.icon(
                                    onPressed: () async {
                                      if (Formkey1.currentState!.validate()) {
                                        Removejourney();
                                      }
                                    },
                                    label: const Text("Remove"),
                                    icon: Icon(Icons.remove),
                                  ),
                                )),
                            Container(
                              margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
                              width: 100,
                              child: FloatingActionButton.extended(
                                onPressed: () {
                                  Alljourney();
                                },
                                icon: Icon(Icons.refresh),
                                label: Text('Refresh'),
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              color: Colors.white,
                              child: Text(
                                'pick date ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 5, 2),
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.black12,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 35,
                                    width: double.infinity,
                                    child: ListView.builder(
                                      itemCount: dys.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (ctx, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selecteddate =
                                                  dys[index].toString();
                                              current = index;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            margin:
                                                EdgeInsets.fromLTRB(5, 1, 5, 1),
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
                                                        color: Colors.red,
                                                        width: 3)
                                                    : null),
                                            duration: const Duration(
                                                milliseconds: 300),
                                            child: Center(
                                              child: Text(dys[index]),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(1, 5, 10, 2),
                                      color: Color.fromARGB(255, 178, 173, 173),
                              child: Row(
                                children: <Widget>[
                                  ElevatedButton.icon(
                                    onPressed: () async {
                                      DateTime? newDate = await showDatePicker(
                                        context: context,
                                        initialDate: dat,
                                        firstDate: DateTime(2022),
                                        lastDate: DateTime(2032),
                                      );
                                      if (newDate == null) return;
                                      setState(() => dat = newDate);
                                    },
                                    label: const Text("pick date"),
                                    icon: Icon(Icons.date_range),
                                  ),
                                  Text(
                                    '${dat.day}/${dat.month}/${dat.year}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Color.fromARGB(255, 119, 114, 114),
                              margin: EdgeInsets.fromLTRB(10, 5, 10, 2),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Container(
                                width: 140,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
                                  width: 285,
                                  decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Color.fromARGB(164, 0, 0, 0)),
                                    color: Colors.white,
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      items: tym
                                          .map((item) =>
                                              DropdownMenuItem<String>(
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
                                      hint: const Text(" Statring time"),
                                      value: Selectedtym,
                                      onChanged: (value) {
                                        setState(() {
                                          Selectedtym = value.toString();
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.arrow_drop_down_circle_outlined,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )),
                            Container(
                              margin: EdgeInsets.fromLTRB(2, 5, 2, 2),
                              width: 100,
                              child: FloatingActionButton.extended(
                                onPressed: () {
                                  Writedata();
                                },
                                icon: Icon(Icons.check),
                                label: Text('Check'),
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.fromLTRB(3, 5, 3, 2),
                    color: Colors.black12,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(3, 5, 3, 2),
                            child: Text(
                              'Journey of uploading data ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(3, 5, 3, 2),
                            child: TextField(
                              controller: journydata,
                              readOnly: true,
                              decoration: InputDecoration(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(3, 5, 3, 2),
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                //uploadjourney();
                                basicdata();
                              },
                              label: const Text("Upload file"),
                              icon: Icon(Icons.upload_file),
                            ),
                            // Text('${dat.day}/${dat.month}/${dat.year}',
                            //   style: TextStyle(fontSize: 15,
                            //        fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    )),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  margin: EdgeInsets.fromLTRB(3, 5, 3, 2),
                  color: Colors.black12,
                  child: ListView(children: <Widget>[
                    DataTable(
                      border: TableBorder.all(color: Colors.black),
                      columns: [
                        DataColumn(
                          label: Text(
                            'car',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                            label: Text(
                          'plate num',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'side num',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'driver name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'Assistant num',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'car status',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(label: Text('seat')),
                        DataColumn(
                            label: Text(
                          'price',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(
                            TextField(
                              controller: car1,
                              decoration: InputDecoration(hintText: "car1"),
                            ),
                          ),
                          DataCell(
                            TextField(
                              controller: car1_platnum,
                              decoration: InputDecoration(hintText: "12345"),
                            ),
                          ),
                          DataCell(
                            TextField(
                              controller: car1_sidenum,
                              decoration: InputDecoration(hintText: "6898"),
                            ),
                          ),
                          DataCell(
                            TextField(
                              controller: car1_drivernum,
                              decoration: InputDecoration(hintText: "Amnuel"),
                            ),
                          ),
                          DataCell(
                            TextField(
                              controller: car1_Assistantnum,
                              decoration:
                                  InputDecoration(hintText: "0921245566"),
                            ),
                          ),
                          DataCell(
                            TextField(
                              controller: car1_carstatus,
                              decoration: InputDecoration(
                                  hintText: "0-no car o/ 1- yes car"),
                            ),
                          ),
                          DataCell(
                            TextField(
                              controller: seatcontrol,
                              decoration: InputDecoration(hintText: "0"),
                            ),
                          ),
                          DataCell(
                            TextField(
                              controller: car1_price,
                              decoration: InputDecoration(hintText: "100 birr"),
                            ),
                          ),
                          DataCell(
                            Container(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    setState((() {
                                      uploadjourney();
                                    }));
                                  },
                                  child: Text('create')),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      );

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
          '$selecteddate' +
          " " +
          "$Selectedtym");
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
          '$selecteddate' +
          " " +
          '$Selectedtym');
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
          '${dat.day}/${dat.month}/${dat.year}' +
          " " +
          '$Selectedtym');
    }

    setState(() {
      fynaldat = journydata.text;

      Selekteddate = ('${dat.day}/${dat.month}/${dat.year}');
      stod = ('$Startingposition' + " " + 'to' + " " + '$dropdownvalue1')
          .toString();
    });
  }
}
