import 'package:flutter/material.dart';
import 'package:news/MyTheme.dart';
import 'package:news/Home/HomeScreen.dart';
import 'package:news/newsFullWidget.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routeName:(context)=>HomeScreen(),
      NewsFullWidget.routeName:(context)=>NewsFullWidget()},
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.myTheme,

    );
  }
}

