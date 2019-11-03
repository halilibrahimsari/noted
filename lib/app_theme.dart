import 'package:flutter/material.dart';

class AppTheme {
  static final AppTheme _singleton = AppTheme._();
  bool isDark = true;

  Color get appColor => isDark ? Color(0xfff45400) : Color(0xfff50fff);
  Color appBackgroundColor;
  static get instance => _singleton;

  AppTheme._() {
    this.appBackgroundColor = Color(0xfff54fff);
  }












}
