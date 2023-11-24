import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

import 'dart:html';
import 'dart:convert';
import 'Sign_in_page.dart';
import 'package:http/http.dart' as http;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class sign_up_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return sign_up_pagewidget();
  }
}

class sign_up_pagewidget extends State {
  bool isHiddenPassWord = true;
  bool isHiddenPassWord1 = true;
  final TextEditingController usernamecontrol = TextEditingController();
  final TextEditingController lastnamecontrol = TextEditingController();
  final TextEditingController phonecontrol = TextEditingController();
  final TextEditingController positioncontrol = TextEditingController();
  final TextEditingController idnumcontrol = TextEditingController();
  final TextEditingController passwordcontrol = TextEditingController();
  final TextEditingController conifermpasswordcontrol = TextEditingController();

  final maskFormatter = new MaskTextInputFormatter(
      mask: '##-##-##-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  final Formkey = GlobalKey<FormState>();

  void insernewemployee() async {
    try {
      Map<String, dynamic> map = {
        "username": usernamecontrol.text.toString().trim(),
        "lastname": lastnamecontrol.text.toString().trim(),
        "phone": phonecontrol.text.toString().trim(),
        "position": positioncontrol.text.toString().trim(),
        "newIdnum": idnumcontrol.text.toString().trim(),
        "password": passwordcontrol.text.toString().trim(),
      };
      var body = json.encode(map);

      var encoding = Encoding.getByName('utf-8');
      const headers = {"Content-Type": "application/json"};

      http.Response response = await http.post(
        Uri.parse('http://localhost:9000/users/register'),
        headers: headers,
        body: body,
        encoding: encoding,
      );

      if (response.statusCode != 200) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Not registerd successfully'),
            content: Text(
                ' username exists\n idnum exists\n and password exists\n '),
            actions: [
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => sign_up_page(),
                      )),
                  child: Text('ok')),
            ],
          ),
        );
      } else {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('registerd successfully'),
            content: Text(
                'Next write your username, idnum and password on login page  so that you can get to companys page '),
            actions: [
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => sign_in_page(),
                      )),
                  child: Text('ok')),
            ],
          ),
        );
      }
    } catch (error) {}
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(5),
          width: width * 0.45,
          height: height * 0.9,
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
                  height: 5,
                ),
                Text('The company Sign up page',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  width: 500,
                  child: TextFormField(
                    controller: usernamecontrol,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "First name"),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return ' please enter  the correct user name ';
                      }
                      {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  width: 500,
                  child: TextFormField(
                    controller: lastnamecontrol,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "last name"),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return ' please enter  the correct last  name ';
                      }
                      {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 55,
                  width: 500,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: phonecontrol,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "phone"),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[0]+[9]+[-.\s]?\d{2}[-.\s]?\d{2}[-.\s]?\d{2}[-.\s]?\d{2}?')
                              .hasMatch(value)) {
                        return ' please enter  the correct phone number/start with 09- /must have 10 digit number';
                      }
                      {
                        return null;
                      }
                    },
                    inputFormatters: [maskFormatter],
                    maxLength: 14,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 55,
                  width: 500,
                  child: TextFormField(
                    controller: positioncontrol,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "posititon"),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return ' please enter  the correct position ';
                      }
                      {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 55,
                  width: 500,
                  child: TextFormField(
                    controller: idnumcontrol,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: " New Id number"),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value)) {
                        return ' please enter  the correct id num ';
                      }
                      {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
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
                    obscureText: isHiddenPassWord1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "   password ",
                      suffixIcon: InkWell(
                          onTap: _togglePasswordView1,
                          child: Icon(Icons.visibility)),
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: 500,
                  child: TextFormField(
                    controller: conifermpasswordcontrol,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value)) {
                        return ' please enter password or the given passwords are not the same ';
                      }
                      if (value != passwordcontrol.text) {
                        return 'passwords not match';
                      }
                      {
                        return null;
                      }
                    },
                    obscureText: isHiddenPassWord,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "  coniferm password ",
                      suffixIcon: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(Icons.visibility)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  //  color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          ' Authenticated by the Authority',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Checkbox(value: isLoading, onChanged: ((value) {})),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    width: 200,
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (Formkey.currentState!.validate()) {
                          insernewemployee();
                          setState(() {
                            isLoading = true;
                          });
                          await Future.delayed(const Duration(seconds: 5));
                          setState(() {
                            isLoading = false;
                          });
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
                          : Text('Sign up'),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    if (isHiddenPassWord == true) {
      isHiddenPassWord = false;
    } else {
      isHiddenPassWord = true;
    }
    setState(() {});
  }

  void _togglePasswordView1() {
    if (isHiddenPassWord1 == true) {
      isHiddenPassWord1 = false;
    } else {
      isHiddenPassWord1 = true;
    }
    setState(() {});
  }

  void comparepassword() {}
}
