import 'package:flutter/material.dart';
import 'package:flutter_foody/src/theme/light_color.dart';

class AppTheme 
{
  const AppTheme();
  static ThemeData lightTheme = ThemeData(
    backgroundColor: LightColor.background,
    iconTheme: IconThemeData(color:LightColor.iconColorRed),
  );

  static TextStyle titleStyle = const TextStyle(color: LightColor.titleTextColor, fontSize: 16);

  static EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10);

  static EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 5, vertical: 5);
  
  static double fullWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static double appBarHeight(BuildContext context){
    return AppBar().preferredSize.height;
  }

  static double paddingTopHeight(BuildContext context){
    return MediaQuery.of(context).padding.top;
  }

  static double paddingBottomHeight(BuildContext context){
    return MediaQuery.of(context).padding.bottom;
  }

  static double fullHeigtContent(BuildContext context) {
    return fullHeight(context) - appBarHeight(context);
  }

  static double sizeBestFoodsTitlesPage()
  {
    return 190.0;
  }

  static double sizeBottomTabbar()
  {
    return 65.0;
  }

  static double sizeFoodMenuPage(double contentViewHeigt) 
  {
    return contentViewHeigt - sizeBestFoodsTitlesPage(); 
  }

}