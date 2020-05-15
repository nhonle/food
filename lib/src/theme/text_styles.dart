import 'package:flutter/material.dart';

class FontSizes {
  static double scale = 1.2;
  static double get body => 14 * scale;
  static double get bodySm => 12 * scale;
  static double get title => 16 * scale;
  static double get titleM => 18 * scale;
  static double get sizeXXL => 28 * scale;
  static double get titleItem => 12 * scale;
  static double get bodyItem => 10 * scale;
}

class TextStyles {
  static TextStyle get title => TextStyle(fontSize: FontSizes.title);
  static TextStyle get titleM => TextStyle(fontSize: FontSizes.titleM);
  static TextStyle get titleNormal => title.copyWith(fontWeight: FontWeight.w600);
  static TextStyle get titleMedium => titleM.copyWith(fontWeight: FontWeight.w300);
  
  static TextStyle get titleItem => TextStyle(fontSize: FontSizes.titleItem, fontWeight: FontWeight.w600);
  static TextStyle get bodyItem => TextStyle(fontSize: FontSizes.bodyItem);
  
  static TextStyle get body => TextStyle(fontSize: FontSizes.body,fontWeight: FontWeight.w300);
  static TextStyle get bodySm => TextStyle(fontSize: FontSizes.bodySm);
}