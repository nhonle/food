import 'package:flutter/material.dart';
import 'package:flutter_foody/src/pages/splash_page.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute()
  {
    return <String, WidgetBuilder>{
      '/':(_)=> SplashPage(),
    };
  }
}