import 'package:flutter/material.dart';
import 'package:flutter_foody/src/config/route.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
void main() {
  runApp(MyApp());
  
}

Widget _materialApp() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.red);
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: Routes.getRoute(),
    );
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return _materialApp();
  }
}

