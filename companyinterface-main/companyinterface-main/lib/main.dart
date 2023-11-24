import 'package:companysinterface/Sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MaterialApp(
    title: "companysinterface",
    home: sign_in_page(),
    debugShowCheckedModeBanner: false,
  ));
}
