import 'package:flutter/material.dart';
import 'package:flutter_blog/pages/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(720, 1280),
      builder: () {
        return MaterialApp(
          home: MyHomePage(title: '小歪的学习笔记'),
        );
      },
    );
  }
}

