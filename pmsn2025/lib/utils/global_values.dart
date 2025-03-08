import 'package:flutter/material.dart';

class GlobalValues{
  //static ValueNotifier isValidating = ValueNotifier(false);
  static ValueNotifier themeApp = ValueNotifier(ThemeData.light());
  static ValueNotifier updList = ValueNotifier(false);
  static ValueNotifier<String> fontApp = ValueNotifier("Roboto");
}
