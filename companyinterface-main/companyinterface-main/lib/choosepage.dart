// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:companysinterface/MyApp.dart';
import 'package:companysinterface/prejornypage2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:universal_html/html.dart';

class Chossepage extends StatefulWidget {
  String Amanj;
  String bus1;
  String name;
  String phone;
  String startingplace;
  String destinationplace;
  String selecteddate;
  String jprice;

  Chossepage({
    Key,
    required this.Amanj,
    required this.bus1,
    required this.name,
    required this.phone,
    required this.startingplace,
    required this.destinationplace,
    required this.selecteddate,
    required this.jprice,
  }) : super(key: null);

  @override
  Choosepagewidget createState() => Choosepagewidget(Amanj, bus1, name, phone,
      startingplace, destinationplace, selecteddate, jprice);
  //}
}

class Choosepagewidget extends State<Chossepage> {
  String Amanj;
  String bus1;
  String name;
  String phone;
  String startingplace;
  String destinationplace;
  String selecteddate;
  String jprice;
  Choosepagewidget(
      this.Amanj,
      this.bus1,
      this.name,
      this.phone,
      this.startingplace,
      this.destinationplace,
      this.selecteddate,
      this.jprice);

  final TextEditingController set1 = TextEditingController();
  final TextEditingController set2 = TextEditingController();
  final TextEditingController set3 = TextEditingController();
  final TextEditingController set4 = TextEditingController();
  final TextEditingController tktcontrol = TextEditingController();

  final TextEditingController car1_Assistantnum = TextEditingController();
  final TextEditingController car1_carstatus = TextEditingController();
  var setnum = [];
  DateTime dat = DateTime.now();
  static var isEnabled1 = true;
  static var isEnabled2 = true;
  static var isEnabled3 = true;
  static var isEnabled4 = true;
  static var isEnabled5 = true;
  static var isEnabled6 = true;
  static var isEnabled7 = true;
  static var isEnabled8 = true;
  static var isEnabled9 = true;
  var blist = [
    isEnabled1,
    isEnabled2,
    isEnabled3,
    isEnabled4,
    isEnabled5,
    isEnabled6,
    isEnabled7,
    isEnabled8,
    isEnabled9
  ];

  @override
  var car_data = [];
  List<dynamic> basiclist = [
    {"qwerty"}
  ];
  var jornylist9 = [];

  String aa = '';
  String bb = '';
  String bryc = '';
  var jlist = [];

  var platnum;
  var sidenum;
  var drivernum;
  var assisnum;
  var prc;
  var jtym;
  var seatnum = [];
  var seatnum99 = [];

  basicdata() async {
    try {
      Map<String, dynamic> map9 = {"jornedata": aa, "car": bb};

      var body = json.encode(map9);
      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};

      http.Response response = await http.post(
          Uri.parse('http://localhost:9000/users/cardata'),
          body: body,
          headers: headers,
          encoding: encoding);

      var data = json.decode(response.body);

      var units = (json.decode(response.body) as Map<String, dynamic>);
      print(units);
      // var nobj = units.entries.map((e) {
      //   return e.value;
      // }).toList();
      //basiclist = units["data"].toList();

      setState(() {
        jlist = units["data"].toList();

        print(jlist);
        print(jlist[0]);

        sidenum = jlist[0][5];
        platnum = jlist[0][4];
        drivernum = jlist[0][6];
        assisnum = jlist[0][7];
        prc = jlist[0][10];
        jtym = jlist[0][2];
        seatnum = jlist[0][9];

        print(sidenum);
        print(platnum);
        print(drivernum);
        print(assisnum);
        print(prc);
        print(seatnum);

        seatnum99 = seatnum.expand((i) => i).toList();
        print(seatnum99.length);

        for (var l = 0; l < seatnum99.length; l++) {
          print(blist[l]);

          if (seatnum99[l] == "1") {
            print('chair1');
            blist[0] = false;
          } else if (seatnum99[l] == "2") {
            print('chair2');
            blist[1] = false;
          } else if (seatnum99[l] == "3") {
            print('chair3');
            blist[2] = false;
          } else if (seatnum99[l] == "4") {
            print('chair4');
            blist[3] = false;
          }
        }
      });
    } on HttpException catch (e) {
      print(e.message);
    }
  }

  //setnumcol

  // setnumcol() async {
  //   try {
  //     Map<String, dynamic> map9 = {"jornedata": aa, "car": bb};

  //     var body = json.encode(map9);
  //     var encoding = Encoding.getByName('utf-8');
  //     const headers = {"Content-Type": "application/json"};

  //     http.Response response = await http.post(
  //         Uri.parse('http://localhost:9000/users/setnum'),
  //         body: body,
  //         headers: headers,
  //         encoding: encoding);

  //     var data = json.decode(response.body);
  //     print(data);

  //     var units = (json.decode(response.body) as Map<String, dynamic>);
  //     //  jornylist = units["data"].toList();
  //     setState(() {
  //       seatnum = units["data"].toList();

  //       print(seatnum);

  //       print(seatnum.length);

  //       print(seatnum[0]);

  //       print(seatnum[0].length);

  //       seatnum.forEach((element) {
  //         for (var l = 0; l < element.length; l++) {
  //           if (element[l].contains('1')) {
  //             blist[0] = false;
  //           } else if (element[l].contains('2')) {
  //             blist[1] = false;
  //           } else if (element[l].contains('3')) {
  //             blist[2] = false;
  //           }
  //         }
  //       });
  //     });
  //   } on HttpException catch (e) {
  //     print(e.message);
  //   }
  // }

  tktman() {
    tktcontrol.text = (('tktnum :  ') +
        (qq) +
        ('\n') +
        ('Name:  ') +
        (name) +
        ('\n') +
        ('phone:  ') +
        (phone) +
        ('\n') +
        ('jornedata:  ') +
        (Amanj) +
        ('\n') +
        ('Time :  ') +
        (tyme) +
        ('\n') +
        ('seatnum :  ') +
        (sete) +
        ('\n') +
        ('car :  ') +
        (bus1) +
        ('\n') +
        ('platnum :  ') +
        (platnum) +
        ('\n') +
        ('sidenum :  ') +
        (sidenum) +
        ('\n') +
        ('drivernum :  ') +
        (drivernum) +
        ('\n') +
        ('assisnum :  ') +
        (assisnum) +
        ('\n') +
        ('price :  ') +
        (set4.text.toString().trim()) +
        ('\n'));
  }

  var sete;
  var tyme;
  void tktdata() async {
    try {
      Map<String, dynamic> map1 = {
        "tktnum": qq,
        "name": name,
        "phone": phone,
        "jornedata": Amanj,
        "seatnum": setnum,
        "car": bus1,
        "platnum": platnum,
        "sidenum": sidenum,
        "drivernum": drivernum,
        "assisnum": assisnum,
        "price": set4.text.toString().trim(),
        "time": tyme,
      };
//Selectedtym
//stod jornedata
      var body = json.encode(map1);
      print(body);
      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};

      final response = await http.post(
        Uri.parse('http://localhost:9000/users/pasd'),
        headers: headers,
        body: body,
        encoding: encoding,
      );

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
        print('qwerty');
        tktman();
        await showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Container(
              height: 500,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ////////////////////
                  ///
                  Text(
                    "This is a Custom Dialog",
                    style: TextStyle(fontSize: 15),
                  ),
                  TextField(
                    controller: tktcontrol,
                    maxLines: null,
                  ),
                  Container(
                    child: Row(
                      children: [
                        ElevatedButton(
                            onPressed: (() {
                              _creatpdf();

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => prejornypage2(
                                        phone: phone,
                                        selecteddate: selecteddate,
                                        tktnum: qq,
                                      )));
                            }),
                            child: Text("Download")),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: (() {
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => prejornypage2(
                                          phone: phone,
                                          selecteddate: selecteddate,
                                          tktnum: qq,
                                        )));
                              });
                            }),
                            child: Text("cancel")),
                      ],
                    ),
                  )

                  //////////////////////
                ],
              ),
            ),

            // title: Text('Journey Added successfully'),
            // actions: [
            //   Container(
            //     height: 500,
            //     width: 300,
            //   ),
            //   TextButton(
            //       onPressed: () => Navigator.pop(context), child: Text('ok')),
            // ],
          ),
        );
      }
    } catch (error) {}
  }

  Future<void> _creatpdf() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();
    document.pages.add().graphics.drawString(
        (tktcontrol.text.trim()), PdfStandardFont(PdfFontFamily.helvetica, 20),
        brush: PdfBrushes.darkBlue,
        bounds: const Rect.fromLTWH(170, 100, 0, 0));
    print(page);
    List<int> bytes = await document.save();
    document.dispose();
    SaveAndLaunchFile(bytes, 'outputs.pdf');
  }

  var qq;
  void abebe() {
    print('dan');
    var rng = new Random();
    var code = rng.nextInt(9000) + 1;
    String ee = code.toString();
    print('ee');

    var stg = phone.toString();

    var result = stg.substring(2, 4);
    var resultp = stg.substring(6, 10);
    stg = result + resultp;
    print('stg');

    qq = (bb + "-" + platnum + "-" + ee + "-" + stg);
    print('qq');
    tyme =
        ('${dat.day}/${dat.month}/${dat.year}/${dat.hour}:${dat.minute}:${dat.second}')
            .toString();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    aa = Amanj;
    bb = bus1;
    basicdata();
    // setnumcol();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                        child: Container(
                            child: Row(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topCenter,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyApp()),
                                    );
                                  },
                                  icon: Icon(Icons.arrow_back)),
                            ),
                            Container(
                              width: width * 0.1,
                            ),
                            Container(
                                width: width * 0.6,
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        (startingplace +
                                            " " +
                                            'to' +
                                            " " +
                                            destinationplace),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        (bus1),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            /////////////////////////////////////////////
                            Flexible(
                                child: Container(
                              child: GestureDetector(
                                onDoubleTap: (blist[0])
                                    ? (() {
                                        double ee = double.parse(prc);

                                        if ((set1.text.isEmpty) &&
                                            (!(set2.text
                                                .trim()
                                                .contains('1'))) &&
                                            (!(set3.text
                                                .trim()
                                                .contains('1')))) {
                                          setState(() {
                                            set1.text = ('1');

                                            if ((set2.text.isEmpty) &&
                                                (set3.text.isEmpty)) {
                                              set4.text = ('${ee * 1}');
                                            } else if (((set2.text.isEmpty) ||
                                                (set3.text.isEmpty))) {
                                              set4.text = ('${ee * 2}');
                                            } else if ((set2.text.isNotEmpty) &&
                                                (set3.text.isNotEmpty)) {
                                              setState(() {
                                                set4.text = ('${ee * 3}');
                                              });
                                            }
                                          });
                                        } else if ((set2.text.isEmpty) &&
                                            (!(set1.text
                                                .trim()
                                                .contains('1'))) &&
                                            (!(set3.text
                                                .trim()
                                                .contains('1')))) {
                                          set2.text = ('1');

                                          if ((set1.text.isEmpty) &&
                                              (set3.text.isEmpty)) {
                                            set4.text = ('${ee * 1}');
                                          } else if ((set1.text.isEmpty) ||
                                              (set3.text.isEmpty)) {
                                            set4.text = ('${ee * 2}');
                                          } else if ((set1.text.isNotEmpty) &&
                                              (set3.text.isNotEmpty)) {
                                            set4.text = ('${ee * 3}');
                                          }
                                        } else if ((set3.text.isEmpty) &&
                                            (!(set1.text
                                                .trim()
                                                .contains('1'))) &&
                                            (!(set2.text
                                                .trim()
                                                .contains('1')))) {
                                          set3.text = ('1');

                                          if ((set2.text.isEmpty) &&
                                              (set1.text.isEmpty)) {
                                            set4.text = ('${ee * 1}');
                                          } else if ((set2.text.isEmpty) ||
                                              (set1.text.isEmpty)) {
                                            set4.text = ('${ee * 2}');
                                          } else if ((set2.text.isNotEmpty) &&
                                              (set1.text.isNotEmpty)) {
                                            set4.text = ('${ee * 3}');
                                          }
                                        }
                                      })
                                    : null,
                                child: ElevatedButton.icon(
                                  onPressed: (blist[0])
                                      ? (() {
                                          double ee = double.parse(prc);
                                          if (set1.text.trim().contains('1')) {
                                            set1.clear();

                                            if ((set2.text.isEmpty) &&
                                                (set3.text.isEmpty)) {
                                              set4.text = '0';
                                            } else if ((set2.text.isEmpty) ||
                                                (set3.text.isEmpty)) {
                                              set4.text = ('${ee}');
                                            } else if ((set2.text.isNotEmpty) &&
                                                (set3.text.isNotEmpty)) {
                                              set4.text = ('${ee * 2}');
                                            }
                                          } else if (set2.text
                                              .trim()
                                              .contains('1')) {
                                            set2.clear();

                                            if ((set1.text.isEmpty) &&
                                                (set3.text.isEmpty)) {
                                              set4.text = '0';
                                            } else if ((set1.text.isEmpty) ||
                                                (set3.text.isEmpty)) {
                                              set4.text = ('${ee}');
                                            } else if ((set1.text.isNotEmpty) &&
                                                (set3.text.isNotEmpty)) {
                                              set4.text = ('${ee * 2}');
                                            }
                                          } else if (set3.text
                                              .trim()
                                              .contains('1')) {
                                            set3.clear();

                                            if ((set2.text.isEmpty) &&
                                                (set1.text.isEmpty)) {
                                              set4.text = '0';
                                            } else if ((set2.text.isEmpty) ||
                                                (set1.text.isEmpty)) {
                                              set4.text = ('${ee}');
                                            } else if ((set2.text.isNotEmpty) &&
                                                (set1.text.isNotEmpty)) {
                                              set4.text = ('${ee * 2}');
                                            }
                                          }
                                        })
                                      : (() {
                                          style:
                                          ElevatedButton.styleFrom(
                                            primary: (blist[1])
                                                ? Colors.green
                                                : Colors.red,
                                          );
                                        }),
                                  icon: Icon(Icons.chair_outlined),
                                  label: const Text('1'),
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        (blist[0]) ? Colors.green : Colors.red,
                                  ),
                                ),
                              ),
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            )),

                            ////////////////////////////////////
                            Flexible(
                                child: Container(
                              child: GestureDetector(
                                onDoubleTap: (blist[1])
                                    ? (() {
                                        double ee = double.parse(prc);

                                        if ((set1.text.isEmpty) &&
                                            (!(set2.text
                                                .trim()
                                                .contains('2'))) &&
                                            (!(set3.text
                                                .trim()
                                                .contains('2')))) {
                                          setState(() {
                                            set1.text = ('2');

                                            if ((set2.text.isEmpty) &&
                                                (set3.text.isEmpty)) {
                                              set4.text = ('${ee * 1}');
                                            } else if (((set2.text.isEmpty) ||
                                                (set3.text.isEmpty))) {
                                              set4.text = ('${ee * 2}');
                                            } else if ((set2.text.isNotEmpty) &&
                                                (set3.text.isNotEmpty)) {
                                              setState(() {
                                                set4.text = ('${ee * 3}');
                                              });
                                            }
                                          });
                                        } else if ((set2.text.isEmpty) &&
                                            (!(set1.text
                                                .trim()
                                                .contains('2'))) &&
                                            (!(set3.text
                                                .trim()
                                                .contains('2')))) {
                                          set2.text = ('2');

                                          if ((set1.text.isEmpty) &&
                                              (set3.text.isEmpty)) {
                                            set4.text = ('${ee * 1}');
                                          } else if ((set1.text.isEmpty) ||
                                              (set3.text.isEmpty)) {
                                            set4.text = ('${ee * 2}');
                                          } else if ((set1.text.isNotEmpty) &&
                                              (set3.text.isNotEmpty)) {
                                            set4.text = ('${ee * 3}');
                                          }
                                        } else if ((set3.text.isEmpty) &&
                                            (!(set1.text
                                                .trim()
                                                .contains('2'))) &&
                                            (!(set2.text
                                                .trim()
                                                .contains('2')))) {
                                          set3.text = ('2');

                                          if ((set2.text.isEmpty) &&
                                              (set1.text.isEmpty)) {
                                            set4.text = ('${ee * 1}');
                                          } else if ((set2.text.isEmpty) ||
                                              (set1.text.isEmpty)) {
                                            set4.text = ('${ee * 2}');
                                          } else if ((set2.text.isNotEmpty) &&
                                              (set1.text.isNotEmpty)) {
                                            set4.text = ('${ee * 3}');
                                          }
                                        }
                                      })
                                    : null,
                                child: ElevatedButton.icon(
                                  onPressed: (blist[1])
                                      ? (() {
                                          double ee = double.parse(prc);
                                          if (set1.text.trim().contains('2')) {
                                            set1.clear();

                                            if ((set2.text.isEmpty) &&
                                                (set3.text.isEmpty)) {
                                              set4.text = '0';
                                            } else if ((set2.text.isEmpty) ||
                                                (set3.text.isEmpty)) {
                                              set4.text = ('${ee}');
                                            } else if ((set2.text.isNotEmpty) &&
                                                (set3.text.isNotEmpty)) {
                                              set4.text = ('${ee * 2}');
                                            }
                                          } else if (set2.text
                                              .trim()
                                              .contains('2')) {
                                            set2.clear();

                                            if ((set1.text.isEmpty) &&
                                                (set3.text.isEmpty)) {
                                              set4.text = '0';
                                            } else if ((set1.text.isEmpty) ||
                                                (set3.text.isEmpty)) {
                                              set4.text = ('${ee}');
                                            } else if ((set1.text.isNotEmpty) &&
                                                (set3.text.isNotEmpty)) {
                                              set4.text = ('${ee * 2}');
                                            }
                                          } else if (set3.text
                                              .trim()
                                              .contains('2')) {
                                            set3.clear();

                                            if ((set2.text.isEmpty) &&
                                                (set1.text.isEmpty)) {
                                              set4.text = '0';
                                            } else if ((set2.text.isEmpty) ||
                                                (set1.text.isEmpty)) {
                                              set4.text = ('${ee}');
                                            } else if ((set2.text.isNotEmpty) &&
                                                (set1.text.isNotEmpty)) {
                                              set4.text = ('${ee * 2}');
                                            }
                                          }
                                        })
                                      : (() {
                                          style:
                                          ElevatedButton.styleFrom(
                                            primary: (blist[1])
                                                ? Colors.green
                                                : Colors.red,
                                          );
                                        }),
                                  icon: Icon(Icons.chair_outlined),
                                  label: const Text('2'),
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        (blist[1]) ? Colors.green : Colors.red,
                                  ),
                                  // style: ElevatedButton.styleFrom(
                                  //   primary:
                                  //       (blist[1]) ? Colors.green : Colors.red,
                                  // ),
                                ),
                              ),
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            )),
                            //////////////////////////////////////////
                            Flexible(
                                child: Container(
                              child: GestureDetector(
                                onDoubleTap: (blist[2])
                                    ? (() {
                                        double ee = double.parse(prc);

                                        if ((set1.text.isEmpty) &&
                                            (!(set2.text
                                                .trim()
                                                .contains('3'))) &&
                                            (!(set3.text
                                                .trim()
                                                .contains('3')))) {
                                          setState(() {
                                            set1.text = ('3');

                                            if ((set2.text.isEmpty) &&
                                                (set3.text.isEmpty)) {
                                              set4.text = ('${ee * 1}');
                                            } else if (((set2.text.isEmpty) ||
                                                (set3.text.isEmpty))) {
                                              set4.text = ('${ee * 2}');
                                            } else if ((set2.text.isNotEmpty) &&
                                                (set3.text.isNotEmpty)) {
                                              setState(() {
                                                set4.text = ('${ee * 3}');
                                              });
                                            }
                                          });
                                        } else if ((set2.text.isEmpty) &&
                                            (!(set1.text
                                                .trim()
                                                .contains('3'))) &&
                                            (!(set3.text
                                                .trim()
                                                .contains('3')))) {
                                          set2.text = ('3');

                                          if ((set1.text.isEmpty) &&
                                              (set3.text.isEmpty)) {
                                            set4.text = ('${ee * 1}');
                                          } else if ((set1.text.isEmpty) ||
                                              (set3.text.isEmpty)) {
                                            set4.text = ('${ee * 2}');
                                          } else if ((set1.text.isNotEmpty) &&
                                              (set3.text.isNotEmpty)) {
                                            set4.text = ('${ee * 3}');
                                          }
                                        } else if ((set3.text.isEmpty) &&
                                            (!(set1.text
                                                .trim()
                                                .contains('3'))) &&
                                            (!(set2.text
                                                .trim()
                                                .contains('3')))) {
                                          set3.text = ('3');

                                          if ((set2.text.isEmpty) &&
                                              (set1.text.isEmpty)) {
                                            set4.text = ('${ee * 1}');
                                          } else if ((set2.text.isEmpty) ||
                                              (set1.text.isEmpty)) {
                                            set4.text = ('${ee * 2}');
                                          } else if ((set2.text.isNotEmpty) &&
                                              (set1.text.isNotEmpty)) {
                                            set4.text = ('${ee * 3}');
                                          }
                                        }
                                      })
                                    : null,
                                child: ElevatedButton.icon(
                                  onPressed: (blist[2])
                                      ? (() {
                                          double ee = double.parse(prc);
                                          if (set1.text.trim().contains('3')) {
                                            set1.clear();

                                            if ((set2.text.isEmpty) &&
                                                (set3.text.isEmpty)) {
                                              set4.text = '0';
                                            } else if ((set2.text.isEmpty) ||
                                                (set3.text.isEmpty)) {
                                              set4.text = ('${ee}');
                                            } else if ((set2.text.isNotEmpty) &&
                                                (set3.text.isNotEmpty)) {
                                              set4.text = ('${ee * 2}');
                                            }
                                          } else if (set2.text
                                              .trim()
                                              .contains('3')) {
                                            set2.clear();

                                            if ((set1.text.isEmpty) &&
                                                (set3.text.isEmpty)) {
                                              set4.text = '0';
                                            } else if ((set1.text.isEmpty) ||
                                                (set3.text.isEmpty)) {
                                              set4.text = ('${ee}');
                                            } else if ((set1.text.isNotEmpty) &&
                                                (set3.text.isNotEmpty)) {
                                              set4.text = ('${ee * 2}');
                                            }
                                          } else if (set3.text
                                              .trim()
                                              .contains('3')) {
                                            set3.clear();

                                            if ((set2.text.isEmpty) &&
                                                (set1.text.isEmpty)) {
                                              set4.text = '0';
                                            } else if ((set2.text.isEmpty) ||
                                                (set1.text.isEmpty)) {
                                              set4.text = ('${ee}');
                                            } else if ((set2.text.isNotEmpty) &&
                                                (set1.text.isNotEmpty)) {
                                              set4.text = ('${ee * 2}');
                                            }
                                          }
                                        })
                                      : (() {
                                          style:
                                          ElevatedButton.styleFrom(
                                            primary: (blist[1])
                                                ? Colors.green
                                                : Colors.red,
                                          );
                                        }),
                                  icon: Icon(Icons.chair_outlined),
                                  label: const Text('3'),
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        (blist[2]) ? Colors.green : Colors.red,
                                  ),
                                ),
                              ),
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            )),

                            /////////////////////////////////////
                            ///
                            ///
                            ///
                            ///
                            ///

                            Flexible(
                                child: Container(
                              child: GestureDetector(
                                onDoubleTap: (blist[3])
                                    ? (() {
                                        double ee = double.parse(prc);

                                        if ((set1.text.isEmpty) &&
                                            (!(set2.text
                                                .trim()
                                                .contains('4'))) &&
                                            (!(set3.text
                                                .trim()
                                                .contains('4')))) {
                                          setState(() {
                                            set1.text = ('4');

                                            if ((set2.text.isEmpty) &&
                                                (set3.text.isEmpty)) {
                                              set4.text = ('${ee * 1}');
                                            } else if (((set2.text.isEmpty) ||
                                                (set3.text.isEmpty))) {
                                              set4.text = ('${ee * 2}');
                                            } else if ((set2.text.isNotEmpty) &&
                                                (set3.text.isNotEmpty)) {
                                              setState(() {
                                                set4.text = ('${ee * 3}');
                                              });
                                            }
                                          });
                                        } else if ((set2.text.isEmpty) &&
                                            (!(set1.text
                                                .trim()
                                                .contains('4'))) &&
                                            (!(set3.text
                                                .trim()
                                                .contains('4')))) {
                                          set2.text = ('4');

                                          if ((set1.text.isEmpty) &&
                                              (set3.text.isEmpty)) {
                                            set4.text = ('${ee * 1}');
                                          } else if ((set1.text.isEmpty) ||
                                              (set3.text.isEmpty)) {
                                            set4.text = ('${ee * 2}');
                                          } else if ((set1.text.isNotEmpty) &&
                                              (set3.text.isNotEmpty)) {
                                            set4.text = ('${ee * 3}');
                                          }
                                        } else if ((set3.text.isEmpty) &&
                                            (!(set1.text
                                                .trim()
                                                .contains('4'))) &&
                                            (!(set2.text
                                                .trim()
                                                .contains('4')))) {
                                          set3.text = ('4');

                                          if ((set2.text.isEmpty) &&
                                              (set1.text.isEmpty)) {
                                            set4.text = ('${ee * 1}');
                                          } else if ((set2.text.isEmpty) ||
                                              (set1.text.isEmpty)) {
                                            set4.text = ('${ee * 2}');
                                          } else if ((set2.text.isNotEmpty) &&
                                              (set1.text.isNotEmpty)) {
                                            set4.text = ('${ee * 3}');
                                          }
                                        }
                                      })
                                    : null,
                                child: ElevatedButton.icon(
                                  onPressed: (blist[3])
                                      ? (() {
                                          double ee = double.parse(prc);
                                          if (set1.text.trim().contains('4')) {
                                            set1.clear();

                                            if ((set2.text.isEmpty) &&
                                                (set3.text.isEmpty)) {
                                              set4.text = '0';
                                            } else if ((set2.text.isEmpty) ||
                                                (set3.text.isEmpty)) {
                                              set4.text = ('${ee}');
                                            } else if ((set2.text.isNotEmpty) &&
                                                (set3.text.isNotEmpty)) {
                                              set4.text = ('${ee * 2}');
                                            }
                                          } else if (set2.text
                                              .trim()
                                              .contains('4')) {
                                            set2.clear();

                                            if ((set1.text.isEmpty) &&
                                                (set3.text.isEmpty)) {
                                              set4.text = '0';
                                            } else if ((set1.text.isEmpty) ||
                                                (set3.text.isEmpty)) {
                                              set4.text = ('${ee}');
                                            } else if ((set1.text.isNotEmpty) &&
                                                (set3.text.isNotEmpty)) {
                                              set4.text = ('${ee * 2}');
                                            }
                                          } else if (set3.text
                                              .trim()
                                              .contains('4')) {
                                            set3.clear();

                                            if ((set2.text.isEmpty) &&
                                                (set1.text.isEmpty)) {
                                              set4.text = '0';
                                            } else if ((set2.text.isEmpty) ||
                                                (set1.text.isEmpty)) {
                                              set4.text = ('${ee}');
                                            } else if ((set2.text.isNotEmpty) &&
                                                (set1.text.isNotEmpty)) {
                                              set4.text = ('${ee * 2}');
                                            }
                                          }
                                        })
                                      : (() {
                                          style:
                                          ElevatedButton.styleFrom(
                                            primary: (blist[1])
                                                ? Colors.green
                                                : Colors.red,
                                          );
                                        }),
                                  icon: Icon(Icons.chair_outlined),
                                  label: const Text('4'),
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        (blist[3]) ? Colors.green : Colors.red,
                                  ),
                                ),
                              ),
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            )),

///////////////////////////////////////////////////////////////////////

                            Flexible(
                                child: Container(
                                    height: 20,
                                    width: 50,
                                    margin: EdgeInsets.fromLTRB(4, 2, 2, 2),
                                    child: TextField(
                                      controller: set1,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ))),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('1'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('2'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(10, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('3'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('4'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                                    height: 20,
                                    width: 50,
                                    margin: EdgeInsets.fromLTRB(4, 2, 2, 2),
                                    child: TextField(
                                      controller: set2,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ))),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('1'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('2'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(10, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('3'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('4'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                                    height: 20,
                                    width: 50,
                                    margin: EdgeInsets.fromLTRB(4, 2, 2, 2),
                                    child: TextField(
                                      readOnly: true,
                                      controller: set3,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ))),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('1'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('2'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(10, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('3'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('4'),
                              ),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('1'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('2'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(10, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('3'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('4'),
                              ),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('1'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('2'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(10, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('3'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('4'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                                    height: 20,
                                    width: 100,
                                    margin: EdgeInsets.fromLTRB(4, 2, 2, 2),
                                    child: TextFormField(
                                      controller: set4,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ))),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('1'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('2'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(10, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('3'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('4'),
                              ),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('1'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('2'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(10, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('3'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('4'),
                              ),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('1'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('2'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(10, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('3'),
                              ),
                            )),
                            Flexible(
                                child: Container(
                              margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chair_outlined),
                                label: const Text('4'),
                              ),
                            )),
                          ],
                        ),
                      ),
                      // Flexible(
                      //   child: Container(
                      //      margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                      //   color: Colors.amber,
                      //   ),

                      //   child: ListView(
                      // scrollDirection: Axis.horizontal,
                      // children: [
                      //   Flexible(
                      //     child: Container(
                      //         height: 20, width: 20, child: Text('telebirr')),
                      //   ),
                      //   Flexible(
                      //     child: Container(
                      //         height: 20, width: 20, child: Text('cbe')),
                      //   ),
                      //   Flexible(
                      //     child: Container(
                      //         height: 20, width: 20, child: Text('Amole')),
                      //   ),
                      //   Flexible(
                      //     child: Container(
                      //         height: 20, width: 20, child: Text('coop')),
                      //   ),
                      //   Flexible(
                      //     child: Container(
                      //         height: 20, width: 20, child: Text('yenepay')),
                      //   ),
                      // ],
                      //  )

                      //  )
                      Container(
                        child: Row(
                          children: <Widget>[
                            Flexible(
                                child: GestureDetector(
                              onTap: () {
                                abebe();
                                print('tkt num to be printed ');

                                setState(() {
                                  if (set1.text.isNotEmpty &&
                                      set2.text.isNotEmpty &&
                                      set3.text.isNotEmpty) {
                                    sete = "," +
                                        set1.text +
                                        "," +
                                        set2.text +
                                        "," +
                                        set3.text;

                                    setnum.add(set1.text);
                                    setnum.add(set2.text);
                                    setnum.add(set3.text);
                                  } else if (set1.text.isNotEmpty &&
                                      set2.text.isEmpty &&
                                      set3.text.isEmpty) {
                                    sete = "," + set1.text;
                                    setnum.add(set1.text);
                                  } else if (set1.text.isEmpty &&
                                      set2.text.isNotEmpty &&
                                      set3.text.isEmpty) {
                                    sete = "," + set2.text;

                                    setnum.add(set2.text);
                                  } else if (set1.text.isEmpty &&
                                      set2.text.isEmpty &&
                                      set3.text.isNotEmpty) {
                                    setnum.add(set3.text);
                                    sete = "," + set3.text;
                                  } else if (set1.text.isNotEmpty &&
                                      set2.text.isNotEmpty &&
                                      set3.text.isEmpty) {
                                    sete = "," + set1.text + "," + set2.text;
                                    setnum.add(set1.text);
                                    setnum.add(set2.text);
                                  } else if (set1.text.isNotEmpty &&
                                      set2.text.isEmpty &&
                                      set3.text.isNotEmpty) {
                                    sete = "," + set1.text + "," + set3.text;
                                    setnum.add(set1.text);

                                    setnum.add(set3.text);
                                  } else if (set1.text.isEmpty &&
                                      set2.text.isNotEmpty &&
                                      set3.text.isNotEmpty) {
                                    sete = "," + set2.text + "," + set3.text;

                                    setnum.add(set2.text);
                                    setnum.add(set3.text);
                                  }
                                });
                                print('tkt data to be printed ');
                                tktdata();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                height: 50,
                                width: 100,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'telebirr',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                height: 50,
                                width: 100,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'cbe',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                height: 50,
                                width: 100,
                                child: GestureDetector(
                                  onTap: () {
                                    tktdata();
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Amole',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                height: 50,
                                width: 100,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'coop',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                height: 50,
                                width: 100,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'yenepay',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Future<void> SaveAndLaunchFile(bytes, String fileName) async {
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", fileName)
      ..click();
  }
}
