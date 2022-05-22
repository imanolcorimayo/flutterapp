import 'package:flutter/material.dart';
import 'package:flutterapp/pages/choose_location.dart';
import 'package:flutterapp/pages/home.dart';
import 'package:flutterapp/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context) =>Loading(),
    '/home': (context) =>Home(),
    '/location': (context) =>ChooseLocation(),
  },
));








