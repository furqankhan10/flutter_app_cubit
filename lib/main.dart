import 'package:flutter/material.dart';
import 'package:flutter_app_cubit/pages/detail_page.dart';
import 'package:flutter_app_cubit/pages/home_page.dart';
import 'package:flutter_app_cubit/pages/navpages/main_page.dart';
import 'package:flutter_app_cubit/pages/welcome_page.dart';
import 'package:flutter_app_cubit/stream.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
    );
  }
}
