import 'package:boilerplate/ui/drageblle_bottom_sheet.dart';
import 'package:boilerplate/ui/login/login.dart';
import 'package:boilerplate/ui/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String calender = '/calender';
  static const String bottomSheet = '/bottomSheet';


  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    calender : (BuildContext context) => LoginScreen(),
    bottomSheet : (BuildContext context) => DraggableBottomSheet(),
  };
}
