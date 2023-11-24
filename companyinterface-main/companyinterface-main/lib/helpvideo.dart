import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:universal_html/html.dart';
import 'package:http/http.dart' as http;

class HelpVideo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //   throw UnimplementedError();
    return HelpVideowidget();
  }
}

class HelpVideowidget extends State {
  DateTime dat = DateTime.now();
  String fynaldat = "";
  final Formkey = GlobalKey<FormState>();
  final Formkey1 = GlobalKey<FormState>();

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

  static final today8 = DateTime(curdat.year, curdat.month, curdat.day + 8);

  static String td8 = DateFormat('EEEE , MMMM d').format(today8);

  static final today9 = DateTime(curdat.year, curdat.month, curdat.day + 9);

  static String td9 = DateFormat('EEEE , MMMM d').format(today9);
  static final today10 = DateTime(curdat.year, curdat.month, curdat.day + 10);

  static String td10 = DateFormat('EEEE , MMMM d').format(today10);
  static final today11 = DateTime(curdat.year, curdat.month, curdat.day + 11);

  static String td11 = DateFormat('EEEE , MMMM d').format(today11);
  static final today12 = DateTime(curdat.year, curdat.month, curdat.day + 12);

  static String td12 = DateFormat('EEEE , MMMM d').format(today12);
  var selecteddate = null;

  String? dropdownvalue;
  String? Startingposition;
  String? dropdownvalue1;
  String? dropdownvalue3;
  String? dropdownvalue4;
  String Selekteddate = " ";
  int current = 100;

  List<String> dys = [
    'Today',
    'Tommorow',
    td2,
    td3,
    td4,
    td5,
    td6,
    td7,
    td8,
    td9,
    td10,
    td11,
    td12
  ];
  static final List<String> tym = [
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '01:00',
    '01:30'
  ];
  final TextEditingController carmodel = TextEditingController();
  final TextEditingController lebrefyl = TextEditingController();
  final TextEditingController ngdfkd = TextEditingController();
  final TextEditingController platnum = TextEditingController();
  final TextEditingController Avlblset = TextEditingController();
  final TextEditingController carcolr = TextEditingController();
  final TextEditingController caridnum = TextEditingController();
  final TextEditingController cardryvr = TextEditingController();
  final TextEditingController cargnralid = TextEditingController();
  final TextEditingController carcontact1 = TextEditingController();
  final TextEditingController carcontact2 = TextEditingController();
  final TextEditingController carbankaccount = TextEditingController();
  final TextEditingController rotp1 = TextEditingController();
  final TextEditingController rotp2 = TextEditingController();
  final TextEditingController rotp3 = TextEditingController();
  final TextEditingController rotp4 = TextEditingController();
  final TextEditingController rotp5 = TextEditingController();
  final TextEditingController rotp6 = TextEditingController();
  final TextEditingController rotp7 = TextEditingController();
  final TextEditingController rotp8 = TextEditingController();
  final TextEditingController rotp9 = TextEditingController();
  final TextEditingController rotp10 = TextEditingController();
  final TextEditingController rotp11 = TextEditingController();
  final TextEditingController rotp12 = TextEditingController();

  final TextEditingController rootid = TextEditingController();
  final TextEditingController rootgnralid = TextEditingController();
  final TextEditingController rootname = TextEditingController();
  final TextEditingController rootdistanc = TextEditingController();
  final TextEditingController rootplacegenralid = TextEditingController();
  final TextEditingController rootplaceid = TextEditingController();
  final TextEditingController deltcarid = TextEditingController();
  final TextEditingController deltrootid = TextEditingController();
  final TextEditingController carapoynt = TextEditingController();
  // final TextEditingController fon = TextEditingController();
//Creatroot//carapoynt
  void Creatroot() async {
    try {
      Map<String, dynamic> map = {
        "rootname": rootname.text.toString().trim(),
        "rootid": rootid.text.toString().trim(),
        "rootgeneralid": rootgnralid.text.toString().trim(),
        "rootdistane": rootdistanc.text.toString().trim(),
        "root": [
          {"rootplace1": rotp1.text.toString().trim()},
          {"rootplace2": rotp2.text.toString().trim()},
          {"rootplace3": rotp3.text.toString().trim()},
          {"rootplace4": rotp4.text.toString().trim()},
          {"rootplace5": rotp5.text.toString().trim()},
          {"rootplace6": rotp6.text.toString().trim()},
          {"rootplace7": rotp7.text.toString().trim()},
          {"rootplace8": rotp8.text.toString().trim()},
          {"rootplace9": rotp9.text.toString().trim()},
          {"rootplace10": rotp10.text.toString().trim()},
          {"rootplace11": rotp11.text.toString().trim()},
          {"rootplace12": rotp12.text.toString().trim()}
        ]
      };
print(map);
      var body = json.encode(map);

      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};

      http.Response response = await http.post(
        Uri.parse('http://localhost:9000/users/createroot'),
        headers: headers,
        body: body,
        encoding: encoding,
      );

      if (response.statusCode != 200) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Not registerd successfully'),
            content: Text(' plesase change plate number and id num '),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('ok')),
            ],
          ),
        );
      } else {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('registerd successfully'),
            content: Text('Now the registerd car can be Appointed '),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('ok')),
            ],
          ),
        );
      }
    } catch (error) {}
  }

  void carreg() async {
    try {
      Map<String, dynamic> map = {
        "carmodel": carmodel.text.toString().trim(),
        "lebre": lebrefyl.text.toString().trim(),
        "ngdfikad": ngdfkd.text.toString().trim(),
        "platenum": platnum.text.toString().trim(),
        "color": carcolr.text.toString().trim(),
        "seatnum": Avlblset.text.toString().trim(),
        "newIdnum": caridnum.text.toString().trim(),
        "generalidnum": cargnralid.text.toString().trim(),
        "driver": cardryvr.text.toString().trim(),
        "Contact1": carcontact1.text.toString().trim(),
        "Contact2": carcontact2.text.toString().trim(),
        "bankaccount": carbankaccount.text.toString().trim(),
        "root": dropdownvalue,
      };
      var body = json.encode(map);

      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};
// Uri.parse('http://localhost:9000/users/jornydatas'),
      http.Response response = await http.post(
        Uri.parse('http://localhost:9000/users/yamu'),
        headers: headers,
        body: body,
        encoding: encoding,
      );

      if (response.statusCode != 200) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Not registerd successfully'),
            content: Text(' plesase change plate number and id num '),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('ok')),
            ],
          ),
        );
      } else {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('registerd successfully'),
            content: Text('Now the registerd car can be Appointed '),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('ok')),
            ],
          ),
        );
      }
    } catch (error) {}
  }

  var Alrot = [];

  Allroot() async {
    try {
      print("started");
      http.Response response = await http.post(
        Uri.parse('http://localhost:9000/users/roootid'),
        body: {"rootgeneralid": "00"},
      );

      var data = json.decode(response.body);
      var units = (json.decode(response.body) as Map<String, dynamic>);
      print(units);

      setState(() {
        Alrot = units["data"].toList();
      });
      //  print(jornylist);
    } on HttpException catch (e) {
      print(e.message);
      print("failed response");
    }
  }

  var carlist = [];
  
    var Available  = 0;
  carAvaiableseat() async {
    print('hiAman');
    try {
      Map<String, dynamic> map9 = {
        "carid": dropdownvalue3.toString().trim(),
      };

      var body = json.encode(map9);
      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};
      http.Response response = await http.post(
          Uri.parse(' http://localhost:9000/users/precaravalableseat'),
          body: body,
          headers: headers,
          encoding: encoding);

      var data = json.decode(response.body);
print(data);
      setState(() {
        //Available = data["data"].toString();

        print(Available);
      });
    } on HttpException {}
  }
  Allcar() async {
    try {
      http.Response response = await http.post(
        Uri.parse('http://localhost:9000/users/Allcar'),
        body: {"generalidnum": "111"},
      );

      var data = json.decode(response.body);
      var units = (json.decode(response.body) as Map<String, dynamic>);
    //  print(units);

      setState(() {
        carlist = units["data"].toList();
      });
      // print(jornylist);
    } on HttpException catch (e) {
      print(e.message);
      print("failed response");
    }
  }

  void Appointcar() async {
    try {
      Map<String, dynamic> map = {
        "carid": dropdownvalue3,
        "rootid": dropdownvalue,
        "date": selecteddate,
        "startingtime": dropdownvalue1,
        "AvailableSeat":Available,
        "Fullinfo": carapoynt.text.trim(),
      };

      var body = json.encode(map);

      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};

      http.Response response = await http.post(
        Uri.parse('http://localhost:9000/users/carapoint'),
        headers: headers,
        body: body,
        encoding: encoding,
      );

      if (response.statusCode != 200) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Not Appointed successfully'),
            content: Text(' plesase change root  id number '),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('ok')),
            ],
          ),
        );
      } else {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Appointed successfully'),
            content: Text('car  is Availabe for sale '),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('ok')),
            ],
          ),
        );
      }
    } catch (error) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  Allroot();
    Allcar();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraints) {
      double width = MediaQuery.of(context).size.width;

      double height = MediaQuery.of(context).size.height;
      return Scaffold(
          body: ListView(
        children: [
          Container(
              margin: EdgeInsets.all(8),
              height: 200,
              width: width,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                ),
              ]),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Text(
                          'prejorney car Apoint',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Text('select car'),
                              ),
                              Container(
                                //  margin: EdgeInsets.fromLTRB(8, 5, 10, 2),
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    items: carlist
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
                                    hint: Text(" car"),
                                    value: dropdownvalue3,
                                    onChanged: (value) {
                                      setState(() {
                                        dropdownvalue3 = value.toString();
                                        carAvaiableseat();
                                        //Startingposition = dropdownvalue.toString();

                                        // check(value.toString());
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
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Text('select root'),
                              ),
                              Container(
                                //  margin: EdgeInsets.fromLTRB(8, 5, 10, 2),
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    items: Alrot.map(
                                        (item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            )).toList(),
                                    hint: Text("root name"),
                                    value: dropdownvalue,
                                    onChanged: (value) {
                                      setState(() {
                                        dropdownvalue = value.toString();
                                        // Startingposition =
                                        //     dropdownvalue.toString();

                                        // check(value.toString());
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
                              ),
                            ],
                          ),
                        )),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 5, 10, 2),
                            child: ElevatedButton.icon(
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
                              label: const Text("Pick date"),
                              icon: Icon(Icons.date_range),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 174, 166, 175)),
                            ),
                          ),

                          // ignore: prefer_const_constructors
                          SizedBox(
                            width: 5,
                          ),

                          Flexible(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(5, 10, 5, 2),
                              //  width: double.infinity
                              width: width * 0.8,
                              color: Color.fromRGBO(0, 0, 0, 0.122),
                              child: SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: Container(
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
                                                      color:
                                                          Colors.purpleAccent,
                                                      width: 3)
                                                  : null),
                                          duration:
                                              const Duration(milliseconds: 300),
                                          child: Center(
                                            child: Text(dys[index]),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text('Select time'),
                        ),
                        Container(
                          //  margin: EdgeInsets.fromLTRB(8, 5, 10, 2),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              items: tym
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
                              hint: Text("time "),
                              value: dropdownvalue1,
                              onChanged: (value) {
                                setState(() {
                                  dropdownvalue1 = value.toString();
                                  //  Startingposition = dropdownvalue.toString();

                                  //check(value.toString());
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
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          child: ElevatedButton(
                              onPressed: () {
                                Writedate();
                                //                           "carid": dropdownvalue3,
                                // "rootid": dropdownvalue,
                                // "date": selecteddate,
                                // "startingtime": dropdownvalue1,
                                // "Fullinfo": carapoynt.text.trim(),

                                carapoynt.text = ("$dropdownvalue3" +
                                    " " +
                                    "$dropdownvalue" +
                                    " " +
                                    "$selecteddate" +
                                    " " +
                                    "$dropdownvalue1");
                              },
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.white,
                                textStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              child: Text('check')),
                        ),
                        Container(
                          height: 40,
                          width: 450,
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(1),
                          child: TextFormField(
                            readOnly: true,
                            controller: carapoynt,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 6),
                          child: ElevatedButton(
                              onPressed: () {
                                Appointcar();
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                              child: Text('Apoint')),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 6),
                          child: ElevatedButton(
                              onPressed: () {},
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                              child: Text('Erase')),
                        ),
                      ]),
                    )
                  ],
                ),
              )),
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  height: 200,
                  width: width,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                    ),
                  ]),
                  child: Container(
                      color: Colors.white,
                      child: Column(children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: Text(
                              'Car Register',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        ////////////////////////////////
                        Form(
                            key: Formkey,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                      child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text('Car model'),
                                      ),
                                      Container(
                                        height: 45,
                                        width: 120,
                                        color: Colors.white,
                                        child: TextFormField(
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: carmodel,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return ' please  enter carmodel ';
                                            }

                                            {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text('lebre file'),
                                      ),
                                      Container(
                                        height: 45,
                                        width: 100,
                                        color: Colors.white,
                                        child: TextFormField(
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              onPressed: () {},
                                              color: Colors.red,
                                              icon: Icon(Icons.folder_open),
                                            ),
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: lebrefyl,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return ' please  give libre data ';
                                            }

                                            {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text('ngd fikad'),
                                      ),
                                      Container(
                                        height: 45,
                                        width: 100,
                                        color: Colors.white,
                                        child: TextFormField(
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              onPressed: () {},
                                              color: Colors.red,
                                              icon: Icon(Icons.folder_open),
                                            ),
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: ngdfkd,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return ' please  give nigedfikade data ';
                                            }

                                            {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text('plate number'),
                                      ),
                                      Container(
                                        height: 45,
                                        width: 100,
                                        color: Colors.white,
                                        child: TextFormField(
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: platnum,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return ' please  enter plate number ';
                                            }

                                            {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text('Available seat'),
                                      ),
                                      Container(
                                        height: 45,
                                        width: 100,
                                        color: Colors.white,
                                        child: TextFormField(
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: Avlblset,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return ' please  enter Availabe ';
                                            }

                                            {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text('color'),
                                      ),
                                      Container(
                                        height: 45,
                                        width: 100,
                                        color: Colors.white,
                                        child: TextFormField(
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: carcolr,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return ' please  enter carcolor ';
                                            }

                                            {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text('id number'),
                                      ),
                                      Container(
                                        height: 45,
                                        width: 100,
                                        color: Colors.white,
                                        child: TextFormField(
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: caridnum,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return ' please  enter car id number ';
                                            }

                                            {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  )),
                                  Container(
                                      margin: EdgeInsets.all(8),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            child: Text('driver'),
                                          ),
                                          Container(
                                            height: 45,
                                            width: 100,
                                            color: Colors.white,
                                            child: TextFormField(
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                              controller: cardryvr,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return ' please  enter driver name ';
                                                }

                                                {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            child: Text(' general id number'),
                                          ),
                                          Container(
                                            height: 45,
                                            width: 100,
                                            color: Colors.white,
                                            child: TextFormField(
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                              controller: cargnralid,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return ' please  give car general id ';
                                                }

                                                {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            child: Text('contact1'),
                                          ),
                                          Container(
                                            height: 45,
                                            width: 100,
                                            color: Colors.white,
                                            child: TextFormField(
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                              controller: carcontact1,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return ' please  enter car contact 1 ';
                                                }

                                                {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            child: Text('contact 2'),
                                          ),
                                          Container(
                                            height: 45,
                                            width: 100,
                                            color: Colors.white,
                                            child: TextFormField(
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                              controller: carcontact2,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return ' please  enter car contact 2 ';
                                                }

                                                {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            child: Text('bank Account'),
                                          ),
                                          Container(
                                            height: 45,
                                            width: 100,
                                            color: Colors.white,
                                            child: TextFormField(
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                              controller: carbankaccount,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return ' please  give bank Account ';
                                                }

                                                {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            child: Text('root'),
                                          ),
                                          Container(
                                            //  margin: EdgeInsets.fromLTRB(8, 5, 10, 2),
                                            width: 200,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1),
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                items: Alrot.map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    )).toList(),
                                                hint: Text("root name"),
                                                value: dropdownvalue4,
                                                onChanged: (value) {
                                                  setState(() {
                                                    dropdownvalue4 =
                                                        value.toString();
                                                    // Startingposition = dropdownvalue.toString();

                                                    // check(value.toString());
                                                  });
                                                  validator:
                                                  (value) => value == null
                                                      ? 'field required'
                                                      : null;
                                                },
                                                icon: const Icon(
                                                  Icons
                                                      .arrow_drop_down_circle_outlined,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 6),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  if (Formkey.currentState!
                                                      .validate()) {
                                                    carreg();
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.green),
                                                child: Text('register')),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            )),

                        ///////////////////////////////////
                        Container(
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Text(
                                    'Car delete',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Text('id number'),
                              ),
                              Container(
                                height: 45,
                                width: 100,
                                color: Colors.white,
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 6),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
                                    child: Text('Delete')),
                              )
                            ],
                          ),
                        )
                      ])),
                ),
                ///////////////////////////////////////////////////////////////

                Form(
                  key: Formkey1,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 250,
                    width: width,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                      ),
                    ]),
                    child: Container(
                        color: Colors.white,
                        child: Column(children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: Text(
                                'Create root',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                              child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Text('Start'),
                              ),
                              Container(
                                height: 45,
                                width: 120,
                                color: Colors.white,
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: rotp1,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' please  give rootplace 1 ';
                                    }

                                    {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.all(5),
                                  child: Icon(Icons.forward)),
                              Container(
                                height: 45,
                                width: 100,
                                color: Colors.white,
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: rotp2,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' please  give rootplace 2 ';
                                    }

                                    {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.all(5),
                                  child: Icon(Icons.forward)),
                              Container(
                                height: 45,
                                width: 100,
                                color: Colors.white,
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: rotp3,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' please  give rootplace 3 ';
                                    }

                                    {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.all(5),
                                  child: Icon(Icons.forward)),
                              Container(
                                height: 45,
                                width: 100,
                                color: Colors.white,
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: rotp4,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' please  give rootplace 4 ';
                                    }

                                    {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.all(5),
                                  child: Icon(Icons.forward)),
                              Container(
                                height: 45,
                                width: 100,
                                color: Colors.white,
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: rotp5,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' please  give rootplace 5 ';
                                    }

                                    {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.all(5),
                                  child: Icon(Icons.forward)),
                              Container(
                                height: 45,
                                width: 100,
                                color: Colors.white,
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: rotp6,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' please  give rootplace 6 ';
                                    }

                                    {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.all(5),
                                  child: Icon(Icons.forward)),
                              Container(
                                height: 45,
                                width: 100,
                                color: Colors.white,
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: rotp7,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' please  give rootplace 7 ';
                                    }

                                    {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.all(5),
                                  child: Icon(Icons.forward)),
                              Container(
                                height: 45,
                                width: 100,
                                color: Colors.white,
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: rotp8,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' please  give rootplace 8 ';
                                    }

                                    {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.all(5),
                                  child: Icon(Icons.forward)),
                              Container(
                                height: 45,
                                width: 100,
                                color: Colors.white,
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: rotp9,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' please  give rootplace 9 ';
                                    }

                                    {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          )),
                          Container(
                              margin: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.all(5),
                                      child: Icon(Icons.forward)),
                                  Container(
                                    height: 45,
                                    width: 100,
                                    color: Colors.white,
                                    child: TextFormField(
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      controller: rotp10,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ' please  give car rootplace 10 ';
                                        }

                                        {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.all(5),
                                      child: Icon(Icons.forward)),
                                  Container(
                                    height: 45,
                                    width: 100,
                                    color: Colors.white,
                                    child: TextFormField(
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      controller: rotp11,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ' please  give rootplace 11 ';
                                        }

                                        {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.all(5),
                                      child: Icon(Icons.forward)),
                                  Container(
                                    height: 45,
                                    width: 100,
                                    color: Colors.white,
                                    child: TextFormField(
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      controller: rotp12,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ' please  give rootplace 12 ';
                                        }

                                        {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text('end'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text('root id'),
                                  ),
                                  Container(
                                    height: 45,
                                    width: 100,
                                    color: Colors.white,
                                    child: TextFormField(
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      controller: rootid,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ' please  give root id ';
                                        }

                                        {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text(' general root id number'),
                                  ),
                                  Container(
                                    height: 45,
                                    width: 100,
                                    color: Colors.white,
                                    child: TextFormField(
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      controller: rootgnralid,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ' please root general id ';
                                        }

                                        {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text('root name'),
                                  ),
                                  Container(
                                    height: 45,
                                    width: 100,
                                    color: Colors.white,
                                    child: TextFormField(
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      controller: rootname,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ' please  give rootname ';
                                        }

                                        {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text('root distance'),
                                  ),
                                  Container(
                                    height: 45,
                                    width: 100,
                                    color: Colors.white,
                                    child: TextFormField(
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      controller: rootdistanc,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ' please  give root distance ';
                                        }

                                        {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 6),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (Formkey1.currentState!
                                              .validate()) {
                                            Creatroot();
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green),
                                        child: Text('create')),
                                  ),
                                ],
                              )),
                          Container(
                            child: Row(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    child: const Text(
                                      'root place',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Text(' general id number'),
                                ),
                                Container(
                                  height: 45,
                                  width: 100,
                                  color: Colors.white,
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Text('id number'),
                                ),
                                Container(
                                  height: 45,
                                  width: 100,
                                  color: Colors.white,
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 6),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.green),
                                      child: Text('create')),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 6),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.red),
                                      child: Text('Delete')),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 5, 5, 5),
                                  child: Text(
                                    ' Delete root ',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Text('root id number'),
                                ),
                                Container(
                                  height: 45,
                                  width: 100,
                                  color: Colors.white,
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 6),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.red),
                                      child: Text('Delete')),
                                ),
                              ],
                            ),
                          )
                        ])),
                  ),
                )
                //////////////////////////////////////////////////////
              ],
            ),
          ),

          /////////////////////////////////////////////////////////////////////////////////////////////////////////
        ],
      ));
    });
  }

  void Writedate() {
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
  }
}
