import 'package:flutter/cupertino.dart';
import 'package:toko/screens/Login/LoginScreens.dart';
import 'package:toko/screens/Home/HomeScreens.dart';

final Map<String, WidgetBuilder> route = {
  LoginScreens.routeName: (context) => LoginScreens(),
  HomeScreens.routeName: (context) => HomeScreens()
};
