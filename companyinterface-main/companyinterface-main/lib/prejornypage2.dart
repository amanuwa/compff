// ignore_for_file: unnecessary_this


import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class prejornypage2 extends StatefulWidget {
  String tktnum;
  String phone;
  String selecteddate;
  prejornypage2({
    Key,
    required this.tktnum,
    required this.phone,
    required this.selecteddate
  }) : super(key: null);

  @override
  State<StatefulWidget> createState() => prejornypage2widget(tktnum, phone,selecteddate);
}

class prejornypage2widget extends State {
  String tktnum;
  String phone;
   String selecteddate;
  
  prejornypage2widget(this.tktnum, this.phone,this.selecteddate);

  var jornylist = [];
  DateTime dat = DateTime.now();
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
  
  var Startingposition;
  int current = 100;
  var Allrot = [];

  List subrot1 = [];
  var subrot2 = [];
  var subrot3 = [];
  var subrot4 = [];
  var subrot5 = [];
  var subrot6 = [];
  var subrot7 = [];
  var subrot8 = [];
  var subrot9 = [];
  var subrot10 = [];
  var subrot11 = [];
  var subrot12 = [];
  var subrot13 = [];
  var subrot14 = [];
  var subrot15 = [];
  var subrot16 = [];
  var subrot17 = [];
  var subrot18 = [];
  var subrot19 = [];
  var subrot20 = [];
  var subrot21 = [];
  var subrot22 = [];
  var subrot23 = [];
  var subrot24 = [];
  var subrot25 = [];
  var subrot26 = [];
  var subrot27 = [];
  var subrot28 = [];
  var subrot29 = [];
  var subrot30 = [];

  String? dropdownvalue1;
  String? dropdownvalue2;
  String? dropdownvalue3;
  String? dropdownvalue4;
  String? dropdownvalue5;
  String? dropdownvalue6;
  String? dropdownvalue7;
  String? dropdownvalue8;
  String? dropdownvalue9;
  String? dropdownvalue10;
  String? dropdownvalue11;
  String? dropdownvalue12;
  String? dropdownvalue13;
  String? dropdownvalue14;
  String? dropdownvalue15;
  String? dropdownvalue16;
  String? dropdownvalue17;
  String? dropdownvalue18;
  String? dropdownvalue19;
  String? dropdownvalue20;
  String? dropdownvalue21;
  String? dropdownvalue22;
  String? dropdownvalue23;
  String? dropdownvalue24;
  String? dropdownvalue25;
  String? dropdownvalue26;
  String? dropdownvalue27;
  String? dropdownvalue28;
  String? dropdownvalue29;
  String? dropdownvalue30;
  final TextEditingController nam = TextEditingController();
  static var isEnabled2 = false;
  static var isEnabled1 = false;
  static var isEnabled3 = false;
  static var isEnabled4 = false;
  static var isEnabled5 = false;
  static var isEnabled6 = false;
  static var isEnabled7 = false;
  static var isEnabled8 = false;
  static var isEnabled9 = false;
  static var isEnabled10 = false;
  static var isEnabled11 = false;
  static var isEnabled12 = false;
  static var isEnabled13 = false;
  static var isEnabled14 = false;
  static var isEnabled15 = false;
  static var isEnabled16 = false;
  static var isEnabled17 = false;
  static var isEnabled18 = false;
  static var isEnabled19 = false;
  static var isEnabled20 = false;
  static var isEnabled21 = false;
  static var isEnabled22 = false;
  static var isEnabled23 = false;
  static var isEnabled24 = false;
  static var isEnabled25 = false;
  static var isEnabled26 = false;
  static var isEnabled27 = false;
  static var isEnabled28 = false;
  static var isEnabled29 = false;
  static var isEnabled30 = false;

  static var pcar1 = false;
  static var pcar2 = false;
  static var pcar3 = false;
  static var pcar4 = false;
  static var pcar5 = false;
  static var pcar6 = false;
  static var pcar7 = false;
  var pcarlist = [pcar1, pcar2, pcar3, pcar4, pcar5, pcar6];
  var caridlist = [];
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
    isEnabled10,
    isEnabled11,
    isEnabled12,
    isEnabled13,
    isEnabled14,
    isEnabled15,
    isEnabled16,
    isEnabled17,
    isEnabled18,
    isEnabled19,
    isEnabled20,
    isEnabled21,
    isEnabled22,
    isEnabled23,
    isEnabled24,
    isEnabled25,
    isEnabled26,
    isEnabled27,
    isEnabled28,
    isEnabled29,
    isEnabled30,
  ];

  Allroot() async {
    try {
      http.Response response = await http.post(
        Uri.parse('http://localhost:9000/users/Allroot'),
        body: {"rootgeneralid": "00"},
      );

      var data = json.decode(response.body);
      var units = (data as Map<String, dynamic>);

      setState(() {
        Allrot = units["data"].toList();
        print(Allrot);

        var l = Allrot.length;

        for (var j = 0; j < Allrot.length; j++) {
          blist[j] = true;
        }
        if (l == 1) {
          subrot1 = (Allrot[0]);
          // hint1=((subrot1[0].toString())+"-"+(subrot1[5].toString())+"-"+(subrot1[12].toString()));
        } else if (l == 2) {
          subrot1 = (Allrot[0]);
          subrot2 = (Allrot[1]);
        } else if (l == 3) {
          subrot1 = (Allrot[0]);
          subrot2 = (Allrot[1]);
          subrot3 = (Allrot[2]);
        }

        // else if (l == 4) {
        //   subrot1 = (Allrot[0]);
        //   subrot2 = (Allrot[1]);

        //   subrot3 = (Allrot[2]);
        //   subrot4 = (Allrot[3]);
        // }
        // else if (l == 5) {
        //   subrot1 = (Allrot[0]);
        //   subrot2 = (Allrot[1]);

        //   subrot3 = (Allrot[2]);
        //   subrot4 = (Allrot[3]);
        //   subrot5 = (Allrot[4]);
        // } else if (l == 6) {
        //   subrot1 = (Allrot[0]);
        //   subrot2 = (Allrot[1]);

        //   subrot3 = (Allrot[2]);
        //   subrot4 = (Allrot[3]);
        //   subrot5 = (Allrot[4]);
        //   subrot6 = (Allrot[5]);
        // } else if (l == 7) {
        //   subrot1 = (Allrot[0]);
        //   subrot2 = (Allrot[1]);

        //   subrot3 = (Allrot[2]);
        //   subrot4 = (Allrot[3]);
        //   subrot5 = (Allrot[4]);
        //   subrot6 = (Allrot[5]);
        //   subrot7 = (Allrot[6]);
        //   //  hint1=((subrot1[0].toString())+("-")+(subrot1[2].toString())+("-")+(subrot1[4].toString())+("-")+(subrot1[6].toString())+("-")+(subrot1[8].toString()));
        //   //  hint1=((subrot1[0].toString())+"-"+(subrot1[5].toString())+"-"+(subrot1[12].toString()));
        // } else if (l == 8) {
        //   subrot1 = (Allrot[0]);
        //   subrot2 = (Allrot[1]);

        //   subrot3 = (Allrot[2]);
        //   subrot4 = (Allrot[3]);
        //   subrot5 = (Allrot[4]);
        //   subrot6 = (Allrot[5]);
        //   subrot7 = (Allrot[6]);
        //   subrot8 = (Allrot[7]);
        // } else if (l == 9) {
        //   subrot1 = (Allrot[0]);
        //   subrot2 = (Allrot[1]);

        //   subrot3 = (Allrot[2]);
        //   subrot4 = (Allrot[3]);
        //   subrot5 = (Allrot[4]);
        //   subrot6 = (Allrot[5]);
        //   subrot7 = (Allrot[6]);
        //   subrot8 = (Allrot[7]);
        //   subrot9 = (Allrot[8]);
        // } else if (l == 10) {
        //   subrot1 = (Allrot[0]);
        //   subrot2 = (Allrot[1]);

        //   subrot3 = (Allrot[2]);
        //   subrot4 = (Allrot[3]);
        //   subrot5 = (Allrot[4]);
        //   subrot6 = (Allrot[5]);
        //   subrot7 = (Allrot[6]);
        //   subrot8 = (Allrot[7]);
        //   subrot9 = (Allrot[8]);
        //   subrot10 = (Allrot[9]);
        // } else if (l == 11) {
        //   subrot1 = (Allrot[0]);
        //   subrot2 = (Allrot[1]);

        //   subrot3 = (Allrot[2]);
        //   subrot4 = (Allrot[3]);
        //   subrot5 = (Allrot[4]);
        //   subrot6 = (Allrot[5]);
        //   subrot7 = (Allrot[6]);
        //   subrot8 = (Allrot[7]);
        //   subrot9 = (Allrot[8]);
        //   subrot10 = (Allrot[9]);
        //   subrot11 = (Allrot[10]);
        // } else if (l == 12) {
        //   subrot1 = (Allrot[0]);
        //   subrot2 = (Allrot[1]);

        //   subrot3 = (Allrot[2]);
        //   subrot4 = (Allrot[3]);
        //   subrot5 = (Allrot[4]);
        //   subrot6 = (Allrot[5]);
        //   subrot7 = (Allrot[6]);
        //   subrot8 = (Allrot[7]);
        //   subrot9 = (Allrot[8]);
        //   subrot10 = (Allrot[9]);
        //   subrot11 = (Allrot[10]);
        //   subrot12 = (Allrot[11]);
        // } else if (l == 13) {
        //   subrot1 = (Allrot[0]);
        //   subrot2 = (Allrot[1]);

        //   subrot3 = (Allrot[2]);
        //   subrot4 = (Allrot[3]);
        //   subrot5 = (Allrot[4]);
        //   subrot6 = (Allrot[5]);
        //   subrot7 = (Allrot[6]);
        //   subrot8 = (Allrot[7]);
        //   subrot9 = (Allrot[8]);
        //   subrot10 = (Allrot[9]);
        //   subrot11 = (Allrot[10]);
        //   subrot13 = (Allrot[12]);
        // }

        //  subrot1=(Allrot[0]);
        //   subrot2=(Allrot[1]);

        //    subrot3=(Allrot[2]);
        //     subrot4=(Allrot[3]);
        //        subrot5=(Allrot[4]);
        //   subrot6=(Allrot[5]);
        //    subrot7=(Allrot[6]);
        // ignore: unnecessary_null_comparison

        // subrot8=(Allrot[7]);

        //  subrot9=(Allrot[8]);
        //   subrot10=(Allrot[9]);
        //    subrot11=(Allrot[10]);
        //     subrot12=(Allrot[11]);
        //        subrot13=(Allrot[12]);
        //   subrot14=(Allrot[13]);
        //    subrot15=(Allrot[14]);
        //     subrot16=(Allrot[15]);

        //      subrot17=(Allrot[16]);
        //   subrot18=(Allrot[17]);
        //    subrot19=(Allrot[18]);
        //     subrot20=(Allrot[19]);
        //        subrot21=(Allrot[20]);
        //   subrot22=(Allrot[21]);
        //    subrot23=(Allrot[22]);
        //     subrot24=(Allrot[23]);

        //  subrot25=(Allrot[24]);
        //   subrot26=(Allrot[25]);
        //    subrot27=(Allrot[26]);
        //     subrot28=(Allrot[27]);
        //        subrot29=(Allrot[28]);
        //   subrot30=(Allrot[29]);
      });
    } on HttpException {}
  }

  String rpprice = "";
  rppryce() async {
    try {
      Map<String, dynamic> map9 = {
        "rootplacename": Startingposition.trim(),
      };

      var body = json.encode(map9);
      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};
      http.Response response = await http.post(
          Uri.parse('http://localhost:9000/users/rppryce'),
          body: body,
          headers: headers,
          encoding: encoding);

      var data = json.decode(response.body);

      setState(() {
        rpprice = data["data"].toString();

        print(rpprice);
      });
    } on HttpException {}
  }

  var dataid = [];

  String c1carid = "";
  String c1carrotid = "";
  String c1cardate = "";
  String c1cartime = "";
  String c1Availableseat = "";
  String c2carid = "";
  String c2carrotid = "";
  String c2cardate = "";
  String c2cartime = "";
  String c2Availableseat = "";
  String c3carid = "";
  String c3carrotid = "";
  String c3cardate = "";
  String c3cartime = "";
  String c3Availableseat = "";
  String c4carid = "";
  String c4carrotid = "";
  String c4cardate = "";
  String c4cartime = "";
  String c4Availableseat = "";
  String c5carid = "";
  String c5carrotid = "";
  String c5cardate = "";
  String c5cartime = "";
  String c5Availableseat = "";
  String c6carid = "";
  String c6carrotid = "";
  String c6cardate = "";
  String c6cartime = "";
  String c6Availableseat = "";

  Allrotid() async {
    try {
      //   Map<String, dynamic> map9 = {
      //   "rootplacename": Startingposition.trim(),
      // };

      // var body = json.encode(map9);
      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};
      //  print(body);
      http.Response response =
          await http.post(Uri.parse('http://localhost:9000/users/roootid'),
              //body: body,
              headers: headers,
              encoding: encoding);

      var data = json.decode(response.body);
      var units = (data as Map<String, dynamic>);

      setState(() {
        dataid = units["data"].toList();
      });


      
    } on HttpException {}
  }

  int index = 2;
  var rotid = [];
  rtrnrotid() async {
  
  
  }

  var Apointedcar = [];
  var rtrndcarid = [];

  var bb = [];
  String ee = "";
  rtrnApointedcar() async {
      for (var s = 0; s < Allrot.length; s++) {
      if (Allrot[s].contains(Startingposition)) {
        //  print(s);

        if (!rotid.contains(dataid[s])) {
          setState(() {
            rotid.add(dataid[s]);
          });
        }
      }
    }



    for (var m = 0; m < rotid.length; m++) {
      //print(rotid);
      try {
        Map<String, dynamic> map8 = {
          "rootid": rotid,
        };

        var body = json.encode(map8);
        var encoding = Encoding.getByName('utf-8');
        const headers = {"Content-Type": "application/json"};

        http.Response response = await http.post(
            Uri.parse('http://localhost:9000/users/rtcar'),
            body: body,
            headers: headers,
            encoding: encoding);

        var data = await json.decode(response.body);

        var units = (data as Map<String, dynamic>);

        setState(() {
          Apointedcar = units["data"].toList();
        });
      } on HttpException {}
    }

    var e = 10;
    var acl = Apointedcar.length;

    //   for( var p=0; p<acl; p++)
    // {

    //   pcarlist[p] = true;

    // }
     setState(() {
      lystcar();
    
    if (acl == 1) {
      pcarlist[0] = true;
      for (var i = 1; i < e; i++) {
        pcarlist[i] = false;
      }
    } else if (acl == 2) {
      for (var i = 0; i < 2; i++) {
        pcarlist[i] = true;
      }
      for (var i = 2; i < e; i++) {
        pcarlist[i] = false;
      }
    } else if (acl == 3) {
      for (var i = 0; i < 3; i++) {
        pcarlist[i] = true;
      }
      for (var i = 3; i < e; i++) {
        pcarlist[i] = false;
      }
    }
});
    // else if (acl == 4) {
    //   for (var i = 0; i < 4; i++) {
    //     pcarlist[i] = true;
    //   }
    //   for (var i = 4; i < e; i++) {
    //     pcarlist[i] = false;
    //   }
    // } else if (acl == 5) {
    //   for (var i = 0; i < 5; i++) {
    //     pcarlist[i] = true;
    //   }
    //   for (var i = 5; i < e; i++) {
    //     pcarlist[i] = false;
    //   }
    // } else if (acl == 5) {
    //   for (var i = 0; i < 5; i++) {
    //     pcarlist[i] = true;
    //   }
    //   for (var i = 5; i < e; i++) {
    //     pcarlist[i] = false;
    //   }
    // } else if (acl == 6) {
    //   for (var i = 0; i < 6; i++) {
    //     pcarlist[i] = true;
    //   }
    //   for (var i = 6; i < e; i++) {
    //     pcarlist[i] = false;
    //   }
    // }
   
  }

  lystcar() {
    var acl = Apointedcar.length;

    if (acl == 1) {
      setState(() {
        c1carid = (Apointedcar[0][1]).toString();
        c1carrotid = (Apointedcar[0][2]).toString();
        c1cardate = (Apointedcar[0][3]).toString();
        c1cartime = (Apointedcar[0][4]).toString();
        c1Availableseat = (Apointedcar[0][6]).toString();

        if ((!caridlist.contains(c1carid))) {
          setState(() {
            caridlist.clear();

            caridlist.add(c1carid);
          });
        }
      });
    } else if (acl == 2) {
      c1carid = (Apointedcar[0][1]).toString();
      c1carrotid = (Apointedcar[0][2]).toString();
      c1cardate = (Apointedcar[0][3]).toString();
      c1cartime = (Apointedcar[0][4]).toString();
      c1Availableseat = (Apointedcar[0][6]).toString();
      c2carid = (Apointedcar[1][1]).toString();
      c2carrotid = (Apointedcar[1][2]).toString();
      c2cardate = (Apointedcar[1][3]).toString();
      c2cartime = (Apointedcar[1][4]).toString();
      c2Availableseat = (Apointedcar[1][6]).toString();
      if ((!caridlist.contains(c1carid)) && (!caridlist.contains(c2carid))) {
        caridlist.clear();

        caridlist.add(c1carid);
        caridlist.add(c2carid);
      }
    } else if (acl == 3) {
      c1carid = (Apointedcar[0][1]).toString();
      c1carrotid = (Apointedcar[0][2]).toString();
      c1cardate = (Apointedcar[0][3]).toString();
      c1cartime = (Apointedcar[0][4]).toString();
      c1Availableseat = (Apointedcar[0][6]).toString();
      c2carid = (Apointedcar[1][1]).toString();
      c2carrotid = (Apointedcar[1][2]).toString();
      c2cardate = (Apointedcar[1][3]).toString();
      c2cartime = (Apointedcar[1][4]).toString();
      c2Availableseat = (Apointedcar[1][5]).toString();
      c3carid = (Apointedcar[2][1]).toString();
      c3carrotid = (Apointedcar[2][2]).toString();
      c3cardate = (Apointedcar[2][3]).toString();
      c3cartime = (Apointedcar[2][4]).toString();
      c3Availableseat = (Apointedcar[2][5]).toString();

      if ((!caridlist.contains(c1carid)) &&
          (!caridlist.contains(c2carid)) &&
          (!caridlist.contains(c3carid))) {
        setState(() {
          caridlist.clear();

          caridlist.add(c1carid);
          caridlist.add(c2carid);
          caridlist.add(c3carid);
          print(caridlist);
        });
      }
      print('caridlist');
      print('caridlist');
      print('caridlist');
      print(caridlist);
      print('caridlist');
      print('caridlist');
    }
    //else if (acl == 4) {
    //   c1carid = (Apointedcar[0][1]).toString();
    //   c1carrotid = (Apointedcar[0][2]).toString();
    //   c1cardate = (Apointedcar[0][3]).toString();
    //   c1cartime = (Apointedcar[0][4]).toString();
    //   c1Availableseat = (Apointedcar[0][6]).toString();
    //   c2carid = (Apointedcar[1][1]).toString();
    //   c2carrotid = (Apointedcar[1][2]).toString();
    //   c2cardate = (Apointedcar[1][3]).toString();
    //   c2cartime = (Apointedcar[1][4]).toString();
    //   c2Availableseat = (Apointedcar[1][6]).toString();
    //   c3carid = (Apointedcar[2][1]).toString();
    //   c3carrotid = (Apointedcar[2][2]).toString();
    //   c3cardate = (Apointedcar[2][3]).toString();
    //   c3cartime = (Apointedcar[2][4]).toString();
    //   c3Availableseat = (Apointedcar[2][6]).toString();
    //   c4carid = (Apointedcar[3][1]).toString();
    //   c4carrotid = (Apointedcar[3][2]).toString();
    //   c4cardate = (Apointedcar[3][3]).toString();
    //   c4cartime = (Apointedcar[3][4]).toString();
    //   c4Availableseat = (Apointedcar[3][6]).toString();
    //   if ((!caridlist.contains(c1carid)) &&
    //       (!caridlist.contains(c2carid)) &&
    //       (!caridlist.contains(c3carid)) &&
    //       (!caridlist.contains(c4carid))) {
    //     setState(() {
    //       caridlist.clear();
    //       caridlist.add(c1carid);
    //       caridlist.add(c2carid);
    //       caridlist.add(c3carid);
    //       caridlist.add(c4carid);
    //     });
    //   }
    // } else if (acl == 5) {
    //   c1carid = (Apointedcar[0][1]).toString();
    //   c1carrotid = (Apointedcar[0][2]).toString();
    //   c1cardate = (Apointedcar[0][3]).toString();
    //   c1cartime = (Apointedcar[0][4]).toString();
    //   c1Availableseat = (Apointedcar[0][6]).toString();
    //   c2carid = (Apointedcar[1][1]).toString();
    //   c2carrotid = (Apointedcar[1][2]).toString();
    //   c2cardate = (Apointedcar[1][3]).toString();
    //   c2cartime = (Apointedcar[1][4]).toString();
    //   c2Availableseat = (Apointedcar[1][6]).toString();
    //   c3carid = (Apointedcar[2][1]).toString();
    //   c3carrotid = (Apointedcar[2][2]).toString();
    //   c3cardate = (Apointedcar[2][3]).toString();
    //   c3cartime = (Apointedcar[2][4]).toString();
    //   c3Availableseat = (Apointedcar[2][6]).toString();
    //   c4carid = (Apointedcar[3][1]).toString();
    //   c4carrotid = (Apointedcar[3][2]).toString();
    //   c4cardate = (Apointedcar[3][3]).toString();
    //   c4cartime = (Apointedcar[3][4]).toString();
    //   c4Availableseat = (Apointedcar[3][6]).toString();

    //   c5carid = (Apointedcar[4][1]).toString();
    //   c5carrotid = (Apointedcar[4][2]).toString();
    //   c5cardate = (Apointedcar[4][3]).toString();
    //   c5cartime = (Apointedcar[4][4]).toString();
    //   c5Availableseat = (Apointedcar[4][6]).toString();
    //   if ((!caridlist.contains(c1carid)) &&
    //       (!caridlist.contains(c2carid)) &&
    //       (!caridlist.contains(c3carid)) &&
    //       (!caridlist.contains(c4carid)) &&
    //       (!caridlist.contains(c5carid))) {
    //     caridlist.clear();

    //     caridlist.add(c1carid);
    //     caridlist.add(c2carid);
    //     caridlist.add(c3carid);
    //     caridlist.add(c4carid);
    //     caridlist.add(c5carid);
    //   }
    // } else if (acl == 6) {
    //   setState(() {
    //     c1carid = (Apointedcar[0][1]).toString();
    //     c1carrotid = (Apointedcar[0][2]).toString();
    //     c1cardate = (Apointedcar[0][3]).toString();
    //     c1cartime = (Apointedcar[0][4]).toString();
    //     c1Availableseat = (Apointedcar[0][6]).toString();
    //     c2carid = (Apointedcar[1][1]).toString();
    //     c2carrotid = (Apointedcar[1][2]).toString();
    //     c2cardate = (Apointedcar[1][3]).toString();
    //     c2cartime = (Apointedcar[1][4]).toString();
    //     c2Availableseat = (Apointedcar[1][6]).toString();
    //     c3carid = (Apointedcar[2][1]).toString();
    //     c3carrotid = (Apointedcar[2][2]).toString();
    //     c3cardate = (Apointedcar[2][3]).toString();
    //     c3cartime = (Apointedcar[2][4]).toString();
    //     c3Availableseat = (Apointedcar[2][6]).toString();
    //     c4carid = (Apointedcar[3][1]).toString();
    //     c4carrotid = (Apointedcar[3][2]).toString();
    //     c4cardate = (Apointedcar[3][3]).toString();
    //     c4cartime = (Apointedcar[3][4]).toString();
    //     c4Availableseat = (Apointedcar[3][6]).toString();

    //     c5carid = (Apointedcar[4][1]).toString();
    //     c5carrotid = (Apointedcar[4][2]).toString();
    //     c5cardate = (Apointedcar[4][3]).toString();
    //     c5cartime = (Apointedcar[4][4]).toString();
    //     c5Availableseat = (Apointedcar[4][6]).toString();

    //     c6carid = (Apointedcar[5][1]).toString();
    //     c6carrotid = (Apointedcar[5][2]).toString();
    //     c6cardate = (Apointedcar[5][3]).toString();
    //     c6cartime = (Apointedcar[5][4]).toString();
    //     c6Availableseat = (Apointedcar[5][6]).toString();
    //     if ((!caridlist.contains(c1carid)) &&
    //         (!caridlist.contains(c2carid)) &&
    //         (!caridlist.contains(c3carid)) &&
    //         (!caridlist.contains(c4carid)) &&
    //         (!caridlist.contains(c5carid)) &&
    //         (!caridlist.contains(c6carid))) {
    //       caridlist.clear();

    //       caridlist.add(c1carid);
    //       caridlist.add(c2carid);
    //       caridlist.add(c3carid);
    //       caridlist.add(c4carid);
    //       caridlist.add(c5carid);
    //       caridlist.add(c6carid);
    //     }
    //   });
    // }
  }

  String ntktnum = "Aman";
  var routecontainer = false;

  validatetktnum() async {
    try {
      Map<String, dynamic> map9 = {"tktnum": ntktnum};

      var body = json.encode(map9);
      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};

      http.Response response = await http.post(
          Uri.parse('http://localhost:9000/users/validatetktnum'),
          body: body,
          headers: headers,
          encoding: encoding);

      var data = json.decode(response.body);
      if (response.statusCode != 200) {
        setState(() {
          routecontainer = false;
        });
      } else if (response.statusCode == 200) {
        setState(() {
          routecontainer = true;
        });
      }
    } on HttpException {}
  }

  @override
  void initState() {
    super.initState();
    // ignore: todo
    // TODO: implement initState
    Allroot();
    Allrotid();

    setState(() {
      nam.text = '$tktnum';
      ntktnum = tktnum;
      validatetktnum();
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraints) {
      double width = MediaQuery.of(context).size.width;
      return Scaffold(
        body: ListView(
          children: [
            Container(
                height: 40,
                decoration: const BoxDecoration(
                    color: Colors.white, boxShadow: [BoxShadow(blurRadius: 2)]),
                // margin: const EdgeInsets.only(to: 10),
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'prejourney',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Flexible(
                child: Container(
              height: 55,
              width: width * 0.4,
              margin: const EdgeInsets.fromLTRB(10, 8, 5, 5),
              color: Colors.white,
              child: Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: nam,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.purpleAccent, width: 1.0),
                          ),
                          border: const OutlineInputBorder(),
                          hintText: 'yourticketnumber'),
                      onChanged: (String value) async {
                        ntktnum = ('$value');

                        setState(() {
                          validatetktnum();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Flexible(
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Did you forget your ticket number? click here',
                            style: TextStyle(color: Colors.red),
                          )))
                ],
              ),
            )),
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                    child: const Text(
                      'Selectyourhomeplace',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ))),
            //////
            Container(
              margin: const EdgeInsets.all(1),
              color: Colors.white,
              height: 200,

              // width:500,

              child: (routecontainer)
                  ? (Row(children: [
                      Container(
                        height: 200,
                        width: width * 0.9,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(blurRadius: 2)]),
                        margin: const EdgeInsets.fromLTRB(5, 2, 2, 2),
                        child: ListView(
                          children: [
                            Container(
                              child: (blist[0])
                                  ? (Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(blurRadius: 2)
                                          ]),
                                      width: 50,
                                      height: 30,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          items: (subrot1)
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          hint: Text(
                                            ((subrot1[0].toString()) +
                                                ("-") +
                                                (subrot1[2].toString()) +
                                                ("-") +
                                                (subrot1[4].toString()) +
                                                ("-") +
                                                (subrot1[6].toString()) +
                                                ("-") +
                                                (subrot1[8].toString())),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          value: dropdownvalue1,
                                          onChanged: (value) {
                                            setState(() {
                                              dropdownvalue1 = value.toString();
                                              Startingposition =
                                                  dropdownvalue1.toString();

                                              rppryce();
                                              rotid.clear();
                                             // rtrnrotid();
                                             rtrnApointedcar();
                                             
                                            //  lystcar();
                                              rotid.clear();
                                            });
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
                                    ))
                                  : null,
                            ),
                            Container(
                              child: (blist[1])
                                  ? (Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(blurRadius: 2)
                                          ]),
                                      width: 50,
                                      height: 30,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          items: subrot2
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          hint: const Text("home place 2"),
                                          value: dropdownvalue2,
                                          onChanged: (value) {
                                            setState(() {
                                              dropdownvalue2 = value.toString();
                                              Startingposition =
                                                  dropdownvalue2.toString();
                                              rppryce();
                                              rotid.clear();
                                              rtrnrotid();
                                              rtrnApointedcar();

                                              // check(value.toString());
                                            });
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
                                    ))
                                  : null,
                            ),
                            Container(
                              child: (blist[2])
                                  ? (Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(blurRadius: 2)
                                          ]),
                                      width: 50,
                                      height: 30,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          items: subrot3
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          hint: const Text("home place 3"),
                                          value: dropdownvalue3,
                                          onChanged: (value) {
                                            setState(() {
                                              dropdownvalue3 = value.toString();
                                              Startingposition =
                                                  dropdownvalue3.toString();

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
                                    ))
                                  : null,
                            ),
                            Container(
                              child: (blist[3])
                                  ? (Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(blurRadius: 2)
                                          ]),
                                      width: 50,
                                      height: 30,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          items: subrot4
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          hint: const Text("home place 4"),
                                          value: dropdownvalue4,
                                          onChanged: (value) {
                                            setState(() {
                                              dropdownvalue4 = value.toString();
                                              Startingposition =
                                                  dropdownvalue4.toString();

                                              //  check(value.toString());
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
                                    ))
                                  : null,
                            ),
                            // Container(
                            //   child: (blist[4])
                            //       ? (Container(
                            //           margin: const EdgeInsets.all(3),
                            //           decoration: const BoxDecoration(
                            //               color: Colors.white,
                            //               boxShadow: [
                            //                 BoxShadow(blurRadius: 2)
                            //               ]),
                            //           width: 50,
                            //           height: 30,
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton<String>(
                            //               items: subrot5
                            //                   .map((item) =>
                            //                       DropdownMenuItem<String>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item,
                            //                           style: const TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               hint: const Text("home place 5"),
                            //               value: dropdownvalue5,
                            //               onChanged: (value) {
                            //                 setState(() {
                            //                   dropdownvalue5 = value.toString();
                            //                   Startingposition =
                            //                       dropdownvalue5.toString();

                            //                   //  check(value.toString());
                            //                 });
                            //                 validator:
                            //                 (value) => value == null
                            //                     ? 'field required'
                            //                     : null;
                            //               },
                            //               icon: const Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_outlined,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ))
                            //       : null,
                            // ),
                            // Container(
                            //   child: (blist[5])
                            //       ? (Container(
                            //           margin: const EdgeInsets.all(3),
                            //           decoration: const BoxDecoration(
                            //               color: Colors.white,
                            //               boxShadow: [
                            //                 BoxShadow(blurRadius: 2)
                            //               ]),
                            //           width: 50,
                            //           height: 30,
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton<String>(
                            //               items: subrot6
                            //                   .map((item) =>
                            //                       DropdownMenuItem<String>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item,
                            //                           style: const TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               hint: const Text("home place 6"),
                            //               value: dropdownvalue6,
                            //               onChanged: (value) {
                            //                 setState(() {
                            //                   dropdownvalue6 = value.toString();
                            //                   Startingposition =
                            //                       dropdownvalue6.toString();

                            //                   //  check(value.toString());
                            //                 });
                            //                 validator:
                            //                 (value) => value == null
                            //                     ? 'field required'
                            //                     : null;
                            //               },
                            //               icon: const Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_outlined,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ))
                            //       : null,
                            // ),
                            // Container(
                            //   child: (blist[6])
                            //       ? (Container(
                            //           margin: const EdgeInsets.all(3),
                            //           decoration: const BoxDecoration(
                            //               color: Colors.white,
                            //               boxShadow: [
                            //                 BoxShadow(blurRadius: 2)
                            //               ]),
                            //           width: 50,
                            //           height: 30,
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton<String>(
                            //               items: subrot7
                            //                   .map((item) =>
                            //                       DropdownMenuItem<String>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item,
                            //                           style: const TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               hint: const Text("home place 7"),
                            //               value: dropdownvalue7,
                            //               onChanged: (value) {
                            //                 setState(() {
                            //                   dropdownvalue7 = value.toString();
                            //                   Startingposition =
                            //                       dropdownvalue7.toString();

                            //                   //  check(value.toString());
                            //                 });
                            //                 validator:
                            //                 (value) => value == null
                            //                     ? 'field required'
                            //                     : null;
                            //               },
                            //               icon: const Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_outlined,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ))
                            //       : null,
                            // ),
                            // Container(
                            //   child: (blist[7])
                            //       ? (Container(
                            //           margin: const EdgeInsets.all(3),
                            //           decoration: const BoxDecoration(
                            //               color: Colors.white,
                            //               boxShadow: [
                            //                 BoxShadow(blurRadius: 2)
                            //               ]),
                            //           width: 50,
                            //           height: 30,
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton<String>(
                            //               items: subrot8
                            //                   .map((item) =>
                            //                       DropdownMenuItem<String>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item,
                            //                           style: const TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               hint: const Text("home place 8"),
                            //               value: dropdownvalue8,
                            //               onChanged: (value) {
                            //                 setState(() {
                            //                   dropdownvalue8 = value.toString();
                            //                   Startingposition =
                            //                       dropdownvalue8.toString();

                            //                   //  check(value.toString());
                            //                 });
                            //                 validator:
                            //                 (value) => value == null
                            //                     ? 'field required'
                            //                     : null;
                            //               },
                            //               icon: const Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_outlined,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ))
                            //       : null,
                            // ),
                            // Container(
                            //   child: (blist[8])
                            //       ? (Container(
                            //           margin: const EdgeInsets.all(3),
                            //           decoration: const BoxDecoration(
                            //               color: Colors.white,
                            //               boxShadow: [
                            //                 BoxShadow(blurRadius: 2)
                            //               ]),
                            //           width: 50,
                            //           height: 30,
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton<String>(
                            //               items: subrot9
                            //                   .map((item) =>
                            //                       DropdownMenuItem<String>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item,
                            //                           style: const TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               hint: const Text("home place 9"),
                            //               value: dropdownvalue9,
                            //               onChanged: (value) {
                            //                 setState(() {
                            //                   dropdownvalue9 = value.toString();
                            //                   Startingposition =
                            //                       dropdownvalue9.toString();

                            //                   //  check(value.toString());
                            //                 });
                            //                 validator:
                            //                 (value) => value == null
                            //                     ? 'field required'
                            //                     : null;
                            //               },
                            //               icon: const Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_outlined,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ))
                            //       : null,
                            // ),
                            // Container(
                            //   child: (blist[9])
                            //       ? (Container(
                            //           margin: const EdgeInsets.all(3),
                            //           decoration: const BoxDecoration(
                            //               color: Colors.white,
                            //               boxShadow: [
                            //                 BoxShadow(blurRadius: 2)
                            //               ]),
                            //           width: 50,
                            //           height: 30,
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton<String>(
                            //               items: subrot10
                            //                   .map((item) =>
                            //                       DropdownMenuItem<String>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item,
                            //                           style: const TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               hint: const Text("home place 10"),
                            //               value: dropdownvalue10,
                            //               onChanged: (value) {
                            //                 setState(() {
                            //                   dropdownvalue10 =
                            //                       value.toString();
                            //                   Startingposition =
                            //                       dropdownvalue10.toString();

                            //                   //  check(value.toString());
                            //                 });
                            //                 validator:
                            //                 (value) => value == null
                            //                     ? 'field required'
                            //                     : null;
                            //               },
                            //               icon: const Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_outlined,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ))
                            //       : null,
                            // ),
                            // Container(
                            //   child: (blist[10])
                            //       ? (Container(
                            //           margin: const EdgeInsets.all(3),
                            //           decoration: const BoxDecoration(
                            //               color: Colors.white,
                            //               boxShadow: [
                            //                 BoxShadow(blurRadius: 2)
                            //               ]),
                            //           width: 50,
                            //           height: 30,
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton<String>(
                            //               items: subrot11
                            //                   .map((item) =>
                            //                       DropdownMenuItem<String>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item,
                            //                           style: const TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               hint: const Text("home place 11"),
                            //               value: dropdownvalue11,
                            //               onChanged: (value) {
                            //                 setState(() {
                            //                   dropdownvalue11 =
                            //                       value.toString();
                            //                   Startingposition =
                            //                       dropdownvalue11.toString();

                            //                   //  check(value.toString());
                            //                 });
                            //                 validator:
                            //                 (value) => value == null
                            //                     ? 'field required'
                            //                     : null;
                            //               },
                            //               icon: const Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_outlined,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ))
                            //       : null,
                            // ),
                            // Container(
                            //   child: (blist[11])
                            //       ? (Container(
                            //           margin: const EdgeInsets.all(3),
                            //           decoration: const BoxDecoration(
                            //               color: Colors.white,
                            //               boxShadow: [
                            //                 BoxShadow(blurRadius: 2)
                            //               ]),
                            //           width: 50,
                            //           height: 30,
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton<String>(
                            //               items: subrot12
                            //                   .map((item) =>
                            //                       DropdownMenuItem<String>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item,
                            //                           style: const TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               hint: const Text("home place 12"),
                            //               value: dropdownvalue12,
                            //               onChanged: (value) {
                            //                 setState(() {
                            //                   dropdownvalue12 =
                            //                       value.toString();
                            //                   Startingposition =
                            //                       dropdownvalue12.toString();

                            //                   //  check(value.toString());
                            //                 });
                            //                 validator:
                            //                 (value) => value == null
                            //                     ? 'field required'
                            //                     : null;
                            //               },
                            //               icon: const Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_outlined,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ))
                            //       : null,
                            // ),
                            // Container(
                            //   child: (blist[12])
                            //       ? (Container(
                            //           margin: const EdgeInsets.all(3),
                            //           decoration: const BoxDecoration(
                            //               color: Colors.white,
                            //               boxShadow: [
                            //                 BoxShadow(blurRadius: 2)
                            //               ]),
                            //           width: 50,
                            //           height: 30,
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton<String>(
                            //               items: subrot13
                            //                   .map((item) =>
                            //                       DropdownMenuItem<String>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item,
                            //                           style: const TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               hint: const Text("home place 13"),
                            //               value: dropdownvalue13,
                            //               onChanged: (value) {
                            //                 setState(() {
                            //                   dropdownvalue13 =
                            //                       value.toString();
                            //                   Startingposition =
                            //                       dropdownvalue13.toString();

                            //                   //  check(value.toString());
                            //                 });
                            //                 validator:
                            //                 (value) => value == null
                            //                     ? 'field required'
                            //                     : null;
                            //               },
                            //               icon: const Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_outlined,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ))
                            //       : null,
                            // ),
                            // Container(
                            //   child: (blist[13])
                            //       ? (Container(
                            //           margin: const EdgeInsets.all(3),
                            //           decoration: const BoxDecoration(
                            //               color: Colors.white,
                            //               boxShadow: [
                            //                 BoxShadow(blurRadius: 2)
                            //               ]),
                            //           width: 50,
                            //           height: 30,
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton<String>(
                            //               items: subrot14
                            //                   .map((item) =>
                            //                       DropdownMenuItem<String>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item,
                            //                           style: const TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               hint: const Text("home place 14"),
                            //               value: dropdownvalue14,
                            //               onChanged: (value) {
                            //                 setState(() {
                            //                   dropdownvalue14 =
                            //                       value.toString();
                            //                   Startingposition =
                            //                       dropdownvalue14.toString();

                            //                   //  check(value.toString());
                            //                 });
                            //                 validator:
                            //                 (value) => value == null
                            //                     ? 'field required'
                            //                     : null;
                            //               },
                            //               icon: const Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_outlined,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ))
                            //       : null,
                            // ),
                            // Container(
                            //   child: (blist[14])
                            //       ? (Container(
                            //           margin: const EdgeInsets.all(3),
                            //           decoration: const BoxDecoration(
                            //               color: Colors.white,
                            //               boxShadow: [
                            //                 BoxShadow(blurRadius: 2)
                            //               ]),
                            //           width: 50,
                            //           height: 30,
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton<String>(
                            //               items: subrot15
                            //                   .map((item) =>
                            //                       DropdownMenuItem<String>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item,
                            //                           style: const TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               hint: const Text("home place 15"),
                            //               value: dropdownvalue15,
                            //               onChanged: (value) {
                            //                 setState(() {
                            //                   dropdownvalue15 =
                            //                       value.toString();
                            //                   Startingposition =
                            //                       dropdownvalue15.toString();

                            //                   //  check(value.toString());
                            //                 });
                            //                 validator:
                            //                 (value) => value == null
                            //                     ? 'field required'
                            //                     : null;
                            //               },
                            //               icon: const Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_outlined,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ))
                            //       : null,
                            // ),
                            // Container(
                            //   child: (blist[15])
                            //       ? (Container(
                            //           margin: const EdgeInsets.all(3),
                            //           decoration: const BoxDecoration(
                            //               color: Colors.white,
                            //               boxShadow: [
                            //                 BoxShadow(blurRadius: 2)
                            //               ]),
                            //           width: 50,
                            //           height: 30,
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton<String>(
                            //               items: subrot16
                            //                   .map((item) =>
                            //                       DropdownMenuItem<String>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item,
                            //                           style: const TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               hint: const Text("home place 16"),
                            //               value: dropdownvalue16,
                            //               onChanged: (value) {
                            //                 setState(() {
                            //                   dropdownvalue16 =
                            //                       value.toString();
                            //                   Startingposition =
                            //                       dropdownvalue16.toString();

                            //                   //  check(value.toString());
                            //                 });
                            //                 validator:
                            //                 (value) => value == null
                            //                     ? 'field required'
                            //                     : null;
                            //               },
                            //               icon: const Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_outlined,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ))
                            //       : null,
                            // ),
                            // Container(
                            //   child: (blist[16])
                            //       ? (Container(
                            //           margin: const EdgeInsets.all(3),
                            //           decoration: const BoxDecoration(
                            //               color: Colors.white,
                            //               boxShadow: [
                            //                 BoxShadow(blurRadius: 2)
                            //               ]),
                            //           width: 50,
                            //           height: 30,
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton<String>(
                            //               items: subrot17
                            //                   .map((item) =>
                            //                       DropdownMenuItem<String>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item,
                            //                           style: const TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               hint: const Text("home place17"),
                            //               value: dropdownvalue17,
                            //               onChanged: (value) {
                            //                 setState(() {
                            //                   dropdownvalue17 =
                            //                       value.toString();
                            //                   Startingposition =
                            //                       dropdownvalue17.toString();

                            //                   //  check(value.toString());
                            //                 });
                            //                 validator:
                            //                 (value) => value == null
                            //                     ? 'field required'
                            //                     : null;
                            //               },
                            //               icon: const Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_outlined,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ))
                            //       : null,
                            // ),
                            // Container(
                            //   child: (blist[17])
                            //       ? (Container(
                            //           margin: const EdgeInsets.all(3),
                            //           decoration: const BoxDecoration(
                            //               color: Colors.white,
                            //               boxShadow: [
                            //                 BoxShadow(blurRadius: 2)
                            //               ]),
                            //           width: 50,
                            //           height: 30,
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton<String>(
                            //               items: subrot18
                            //                   .map((item) =>
                            //                       DropdownMenuItem<String>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item,
                            //                           style: const TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               hint: const Text("home place 18"),
                            //               value: dropdownvalue18,
                            //               onChanged: (value) {
                            //                 setState(() {
                            //                   dropdownvalue18 =
                            //                       value.toString();
                            //                   Startingposition =
                            //                       dropdownvalue18.toString();

                            //                   //  check(value.toString());
                            //                 });
                            //                 validator:
                            //                 (value) => value == null
                            //                     ? 'field required'
                            //                     : null;
                            //               },
                            //               icon: const Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_outlined,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ))
                            //       : null,
                            // ),
                            // Container(
                            //   child: (blist[18])
                            //       ? (Container(
                            //           margin: const EdgeInsets.all(3),
                            //           decoration: const BoxDecoration(
                            //               color: Colors.white,
                            //               boxShadow: [
                            //                 BoxShadow(blurRadius: 2)
                            //               ]),
                            //           width: 50,
                            //           height: 30,
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton<String>(
                            //               items: subrot19
                            //                   .map((item) =>
                            //                       DropdownMenuItem<String>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item,
                            //                           style: const TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               hint: const Text("home place 19"),
                            //               value: dropdownvalue19,
                            //               onChanged: (value) {
                            //                 setState(() {
                            //                   dropdownvalue19 =
                            //                       value.toString();
                            //                   Startingposition =
                            //                       dropdownvalue19.toString();

                            //                   //check(value.toString());
                            //                 });
                            //                 validator:
                            //                 (value) => value == null
                            //                     ? 'field required'
                            //                     : null;
                            //               },
                            //               icon: const Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_outlined,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ))
                            //       : null,
                            // ),
                            // Container(
                            //   child: (blist[19])
                            //       ? (Container(
                            //           margin: const EdgeInsets.all(3),
                            //           decoration: const BoxDecoration(
                            //               color: Colors.white,
                            //               boxShadow: [
                            //                 BoxShadow(blurRadius: 2)
                            //               ]),
                            //           width: 50,
                            //           height: 30,
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton<String>(
                            //               items: subrot20
                            //                   .map((item) =>
                            //                       DropdownMenuItem<String>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item,
                            //                           style: const TextStyle(
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                             fontSize: 15,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               hint: const Text("home place 20"),
                            //               value: dropdownvalue20,
                            //               onChanged: (value) {
                            //                 setState(() {
                            //                   dropdownvalue20 =
                            //                       value.toString();
                            //                   Startingposition =
                            //                       dropdownvalue20.toString();

                            //                   //check(value.toString());
                            //                 });
                            //                 validator:
                            //                 (value) => value == null
                            //                     ? 'field required'
                            //                     : null;
                            //               },
                            //               icon: const Icon(
                            //                 Icons
                            //                     .arrow_drop_down_circle_outlined,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ),
                            //         ))
                            //       : null,
                            // ),
                          ],
                        ),
                      )
                    ]))
                  : Text(
                      'your ticket number is not correct',
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    ),
            ),

            ///////////////////////////
            Row(
              children: [
                Container(
                  // margin: EdgeInsets.fromLTRB(10, 10, 1, 5),
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  width: width * 0.8,
                  child: Column(
                    children: [
                      Container(
                          child: (pcarlist[0])
                              ? Container(
                                  margin:
                                      const EdgeInsets.only(left: 3, top: 5),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                      boxShadow: [BoxShadow(blurRadius: 2)]),
                                  width: width * 0.75,
                                  height: 100,
                                  child: Container(
                                    //rr.add('${element['carstatus']}');

                                    child: Column(
                                      children: [
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Container(
                                                    width: 25,
                                                    margin: EdgeInsets.all(3),
                                                    child: const Text(
                                                      "car :",
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    width: 40,
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child: Text(c1carid,
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    width: 70,
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child:  const Text(
                                                      'Starting place',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:  TextStyle(
                                                        
                                                          fontSize: 11,
                                                           ),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    width: 70,
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child: Text(
                                                      Startingposition,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                          fontSize: 11,
                                                           ),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    width: 45,
                                                    child: Text(
                                                      'picktime',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.all(3),
                                                    child: Text(c1cartime)),
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: const Text(
                                                'Available seat   : ',
                                                style: TextStyle(fontSize: 11),
                                              )),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 2),
                                                  //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                  // ignore: avoid_function_literals_in_foreach_calls
                                                  child: Text(c1Availableseat)),
                                              Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child:
                                                      const Text(' price : ')),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 2),
                                                  // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                  // ignore: avoid_function_literals_in_foreach_calls
                                                  child: Text(
                                                    rpprice,
                                                    style:
                                                        TextStyle(fontSize: 11),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 3, top: 7),
                                                    child: const Text(
                                                      'select number of person ',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 3,
                                                        top: 7,
                                                        right: 3,
                                                        bottom: 1),
                                                    child: ElevatedButton(
                                                        onPressed: () {},
                                                        child:
                                                            const Text('1'))),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        2, 7, 3, 1),
                                                    child: ElevatedButton(
                                                        onPressed: () {},
                                                        child:
                                                            const Text('2'))),
                                              ),
                                              Flexible(
                                                  child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    2, 7, 3, 1),
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: const Text('pay'),
                                                ),
                                              )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : null),

                      // //car2
                      Container(
                          child: (pcarlist[1])
                              ? Container(
                                  margin:
                                      const EdgeInsets.only(left: 3, top: 5),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                      boxShadow: [BoxShadow(blurRadius: 2)]),
                                  width: width * 0.75,
                                  height: 100,
                                  child: Container(
                                    //rr.add('${element['carstatus']}');

                                    child: Column(
                                      children: [
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Container(
                                                    width: 25,
                                                    margin: EdgeInsets.all(3),
                                                    child: const Text(
                                                      "car :",
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    width: 40,
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child: Text(c2carid,
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                              ),
                                                 Flexible(
                                                child: Container(
                                                    width: 70,
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child:  const Text(
                                                      'Starting place',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:  TextStyle(
                                                        
                                                          fontSize: 11,
                                                           ),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    width: 70,
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child: Text(
                                                      Startingposition,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                          fontSize: 11,
                                                           ),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    width: 45,
                                                    child: Text(
                                                      'picktime',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.all(3),
                                                    child: Text(c1cartime)),
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: const Text(
                                                'Available seat   : ',
                                                style: TextStyle(fontSize: 11),
                                              )),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 2),
                                                  //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                  // ignore: avoid_function_literals_in_foreach_calls
                                                  child: Text(c2Availableseat)),
                                              Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child:
                                                      const Text(' price : ')),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 2),
                                                  // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                  // ignore: avoid_function_literals_in_foreach_calls
                                                  child: Text(
                                                    rpprice,
                                                    style:
                                                        TextStyle(fontSize: 11),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 3, top: 7),
                                                    child: const Text(
                                                      'select number of person ',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 3,
                                                        top: 7,
                                                        right: 3,
                                                        bottom: 1),
                                                    child: ElevatedButton(
                                                        onPressed: () {},
                                                        child:
                                                            const Text('1'))),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        2, 7, 3, 1),
                                                    child: ElevatedButton(
                                                        onPressed: () {},
                                                        child:
                                                            const Text('2'))),
                                              ),
                                              Flexible(
                                                  child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    2, 7, 3, 1),
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: const Text('pay'),
                                                ),
                                              )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : null),

                      //car2

                      //car3
                      Container(
                          child: (pcarlist[2])
                              ? Container(
                                  margin:
                                      const EdgeInsets.only(left: 3, top: 5),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                      boxShadow: [BoxShadow(blurRadius: 2)]),
                                  width: width * 0.75,
                                  height: 100,
                                  child: Container(
                                    //rr.add('${element['carstatus']}');

                                    child: Column(
                                      children: [
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Container(
                                                    width: 25,
                                                    margin: EdgeInsets.all(3),
                                                    child: const Text(
                                                      "car :",
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    width: 40,
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child: Text(c3carid,
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                              ),
                                               Flexible(
                                                child: Container(
                                                    width: 70,
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child:  const Text(
                                                      'Starting place',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:  TextStyle(
                                                        
                                                          fontSize: 11,
                                                           ),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    width: 70,
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child: Text(
                                                      Startingposition,
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
                                                      'picktime',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.all(3),
                                                    child: Text(c1cartime)),
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: const Text(
                                                'Available seat   : ',
                                                style: TextStyle(fontSize: 11),
                                              )),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 2),
                                                  //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                  // ignore: avoid_function_literals_in_foreach_calls
                                                  child: Text(c3Availableseat)),
                                              Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child:
                                                      const Text(' price : ')),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 2),
                                                  // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                  // ignore: avoid_function_literals_in_foreach_calls
                                                  child: Text(
                                                    rpprice,
                                                    style:
                                                        TextStyle(fontSize: 11),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 3, top: 7),
                                                    child: const Text(
                                                      'select number of person ',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 3,
                                                        top: 7,
                                                        right: 3,
                                                        bottom: 1),
                                                    child: ElevatedButton(
                                                        onPressed: () {},
                                                        child:
                                                            const Text('1'))),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        2, 7, 3, 1),
                                                    child: ElevatedButton(
                                                        onPressed: () {},
                                                        child:
                                                            const Text('2'))),
                                              ),
                                              Flexible(
                                                  child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    2, 7, 3, 1),
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: const Text('pay'),
                                                ),
                                              )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : null),

                      //car2
                      //car4
                      Container(
                          child: (pcarlist[3])
                              ? Container(
                                  margin:
                                      const EdgeInsets.only(left: 3, top: 5),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                      boxShadow: [BoxShadow(blurRadius: 2)]),
                                  width: width * 0.75,
                                  height: 100,
                                  child: Container(
                                    //rr.add('${element['carstatus']}');

                                    child: Column(
                                      children: [
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Container(
                                                    width: 25,
                                                    margin: EdgeInsets.all(3),
                                                    child: const Text(
                                                      "car :",
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    width: 40,
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child: Text(c4carid,
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    width: 70,
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child: Text(
                                                      c4carrotid,
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
                                                      'picktime',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.all(3),
                                                    child: Text(c1cartime)),
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: const Text(
                                                'Available seat   : ',
                                                style: TextStyle(fontSize: 11),
                                              )),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 2),
                                                  //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                  // ignore: avoid_function_literals_in_foreach_calls
                                                  child: Text(c4Availableseat)),
                                              Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child:
                                                      const Text(' price : ')),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 2),
                                                  // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                  // ignore: avoid_function_literals_in_foreach_calls
                                                  child: Text(
                                                    rpprice,
                                                    style:
                                                        TextStyle(fontSize: 11),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 3, top: 7),
                                                    child: const Text(
                                                      'select number of person ',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 3,
                                                        top: 7,
                                                        right: 3,
                                                        bottom: 1),
                                                    child: ElevatedButton(
                                                        onPressed: () {},
                                                        child:
                                                            const Text('1'))),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        2, 7, 3, 1),
                                                    child: ElevatedButton(
                                                        onPressed: () {},
                                                        child:
                                                            const Text('2'))),
                                              ),
                                              Flexible(
                                                  child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    2, 7, 3, 1),
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: const Text('pay'),
                                                ),
                                              )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : null),

                      //car2
                      //car5
                      Container(
                          child: (pcarlist[4])
                              ? Container(
                                  margin:
                                      const EdgeInsets.only(left: 3, top: 5),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                      boxShadow: [BoxShadow(blurRadius: 2)]),
                                  width: width * 0.75,
                                  height: 100,
                                  child: Container(
                                    //rr.add('${element['carstatus']}');

                                    child: Column(
                                      children: [
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Container(
                                                    width: 25,
                                                    margin: EdgeInsets.all(3),
                                                    child: const Text(
                                                      "car :",
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    width: 40,
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child: Text(c5carid,
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    width: 70,
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child: Text(
                                                      c5carrotid,
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
                                                      'picktime',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.all(3),
                                                    child: Text(c1cartime)),
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: const Text(
                                                'Available seat   : ',
                                                style: TextStyle(fontSize: 11),
                                              )),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 2),
                                                  //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                  // ignore: avoid_function_literals_in_foreach_calls
                                                  child: Text(c5Availableseat)),
                                              Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child:
                                                      const Text(' price : ')),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 2),
                                                  // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                  // ignore: avoid_function_literals_in_foreach_calls
                                                  child: Text(
                                                    rpprice,
                                                    style:
                                                        TextStyle(fontSize: 11),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 3, top: 7),
                                                    child: const Text(
                                                      'select number of person ',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 3,
                                                        top: 7,
                                                        right: 3,
                                                        bottom: 1),
                                                    child: ElevatedButton(
                                                        onPressed: () {},
                                                        child:
                                                            const Text('1'))),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        2, 7, 3, 1),
                                                    child: ElevatedButton(
                                                        onPressed: () {},
                                                        child:
                                                            const Text('2'))),
                                              ),
                                              Flexible(
                                                  child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    2, 7, 3, 1),
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: const Text('pay'),
                                                ),
                                              )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : null),

                      //car2
                      //car6

                      Container(
                          child: (pcarlist[5])
                              ? Container(
                                  margin:
                                      const EdgeInsets.only(left: 3, top: 5),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                      boxShadow: [BoxShadow(blurRadius: 2)]),
                                  width: width * 0.75,
                                  height: 100,
                                  child: Container(
                                    //rr.add('${element['carstatus']}');

                                    child: Column(
                                      children: [
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Container(
                                                    width: 25,
                                                    margin: EdgeInsets.all(3),
                                                    child: const Text(
                                                      "car :",
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    width: 40,
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child: Text(c6carid,
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    width: 70,
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child: Text(
                                                      c6carrotid,
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
                                                      'picktime',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.all(3),
                                                    child: Text(c1cartime)),
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child: const Text(
                                                'Available seat   : ',
                                                style: TextStyle(fontSize: 11),
                                              )),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 2),
                                                  //margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                  // ignore: avoid_function_literals_in_foreach_calls
                                                  child: Text(c6Availableseat)),
                                              Flexible(
                                                  // margin: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                                                  child:
                                                      const Text(' price : ')),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 2),
                                                  // margin: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                                                  // ignore: avoid_function_literals_in_foreach_calls
                                                  child: Text(
                                                    rpprice,
                                                    style:
                                                        TextStyle(fontSize: 11),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 3, top: 7),
                                                    child: const Text(
                                                      'select number of person ',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    )),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 3,
                                                        top: 7,
                                                        right: 3,
                                                        bottom: 1),
                                                    child: ElevatedButton(
                                                        onPressed: () {},
                                                        child:
                                                            const Text('1'))),
                                              ),
                                              Flexible(
                                                child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        2, 7, 3, 1),
                                                    child: ElevatedButton(
                                                        onPressed: () {},
                                                        child:
                                                            const Text('2'))),
                                              ),
                                              Flexible(
                                                  child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    2, 7, 3, 1),
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: const Text('pay'),
                                                ),
                                              )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : null),

                      //car2
                    ],
                  ),
                ),
                // Container(
                //   alignment: Alignment.topRight,
                //   color: Colors.white,
                //   width: width * 0.2,
                //   child: (true)
                //       ? ListView(
                //           scrollDirection: Axis.vertical,
                //           children: [
                //             Container(
                //               width: 70,
                //               height: 50,
                //               margin: EdgeInsets.all(5),
                //               decoration: const BoxDecoration(
                //                   color: Colors.white,
                //                   boxShadow: [BoxShadow(blurRadius: 2)]),
                //               child: Image(
                //                   image: AssetImage('images/cbebirr.jpg')),
                //             ),
                //             Container(
                //               margin: EdgeInsets.all(5),
                //               decoration: const BoxDecoration(
                //                   color: Colors.white,
                //                   boxShadow: [BoxShadow(blurRadius: 2)]),
                //               width: 70,
                //               height: 50,
                //               child: const Image(
                //                 image: AssetImage('images/telebirr.png'),
                //               ),
                //             ),
                //             Container(
                //               width: 70,
                //               height: 50,
                //               margin: EdgeInsets.all(5),
                //               decoration: const BoxDecoration(
                //                   color: Colors.white,
                //                   boxShadow: [BoxShadow(blurRadius: 2)]),
                //               child:
                //                   Image(image: AssetImage('images/Amole.jpg')),
                //             ),
                //           ],
                //         )
                //       : null,
                //   //   child: (true) ? (Container()) : null,
                // ),
              ],
            )
          ],
        ),
      );
    });
  }
}
