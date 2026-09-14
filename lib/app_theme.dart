import 'package:flutter/material.dart';

class AppTheme{
    ThemeData Lighttheme(){
      return ThemeData(brightness: Brightness.light);
    }

    ThemeData Darktheme(){
      return ThemeData(brightness: Brightness.dark);
    }
}