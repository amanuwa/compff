import 'dart:convert';
import 'dart:html';

import 'package:companysinterface/sing_up_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'MyApp.dart';

class sign_in_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return sign_in_pagewidget();
  }
}

class sign_in_pagewidget extends State {
  bool isHiddenPassWord2 = true;
  final TextEditingController usernamecontrol = TextEditingController();
  final TextEditingController idnumcontrol = TextEditingController();
  final TextEditingController passwordcontrol = TextEditingController();

  final Formkey = GlobalKey<FormState>();
  bool isLoading = false;
  loginemployee(String username, String newIdnum, String password) async {
    //Console.log('aman');

    try {
      Map<String, dynamic> map = {
        "username": usernamecontrol.text.toString().trim(),
        "newIdnum": idnumcontrol.text.toString().trim(),
        "password": passwordcontrol.text.toString().trim(),
      };

      SharedPreferences prefs = await SharedPreferences.getInstance();

      var body = json.encode(map);

      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};

      http.Response response = await http.post(
        Uri.parse('http://localhost:9000/users/login'),
        headers: headers,
        body: body,
        encoding: encoding,
      );

      if (response.statusCode != 200) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(' login Not successfully'),
            content: Text(
                ' username not correct or\n idnum not correct or \n and password not correct\n '),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('ok')),
            ],
          ),
        );
        setState(() {
          isLoading = false;
        });
      } else {
        var jsonData = null;
        jsonData = (response.body);
        aman();
      }
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(5),
        width: width * 0.3,
        height: height * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              // offset: Offset(10, 10),
              blurRadius: 10,
              // color: Color.fromARGB(255, 206, 54, 244).withOpacity(0.5)
            ),
          ],
        ),
        child: Form(
          key: Formkey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text('The company Sign in page',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: 500,
                child: TextFormField(
                  controller: usernamecontrol,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return ' please enter  the correct user name ';
                    }
                    {
                      return null;
                    }
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "First name"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: 500,
                child: TextFormField(
                  controller: idnumcontrol,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value)) {
                      return ' please enter  the correct id num ';
                    }
                    {
                      return null;
                    }
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "ID number"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: 500,
                child: TextFormField(
                  controller: passwordcontrol,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value)) {
                      return ' please enter password ';
                    }
                    {
                      return null;
                    }
                  },
                  obscureText: isHiddenPassWord2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: " password ",
                    suffixIcon: InkWell(
                        onTap: _togglePasswordView2,
                        child: Icon(Icons.visibility)),
                  ),
                ),
              ),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Remember me',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Switch(value: isLoading, onChanged: ((value) {}))
                  ],
                ),
              ),
              Container(
                  width: 300,
                  padding: EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      if (Formkey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        loginemployee((usernamecontrol.text),
                            (idnumcontrol.text), (passwordcontrol.text));
                      }
                    },
                    child: (isLoading)
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1.5,
                            ))
                        : Text('Sign in'),
                  )),
              SizedBox(
                height: 10,
              ),

              // Container(
              //   child: Center(
              //     child: Row(
              //       children: <Widget>[

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'Do not have An Account yet?',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return sign_up_page();
                        }));
                      },
                      child: Text(
                        'create',
                        style: TextStyle(color: Colors.green),
                      ),
                    )
                  ],
                ),
              )

              //       ],
              //     ),
              //   ),

              // ),
            ],
          ),
        ),
      ),
    ));
  }

  void _togglePasswordView2() {
    if (isHiddenPassWord2 == true) {
      isHiddenPassWord2 = false;
    } else {
      isHiddenPassWord2 = true;
    }
  }

  aman() {
    setState(() {
      isLoading = false;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => MyApp()),
          (Route<dynamic> route) => false);
    });
  }
}
