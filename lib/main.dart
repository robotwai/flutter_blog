import 'package:flutter/material.dart';
import 'package:flutter_blog/pages/detail_page.dart';
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.title,
          style: TextStyle(
            fontSize: 36.sp,
            color: Colors.white
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (c, index) {
          return GestureDetector(
            child: Container(
              color: Colors.white,
              height: 200.h,
              padding: EdgeInsets.only(left: 36.w,top: 20.w,bottom: 20,right: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(child: Text('title',
                          style: TextStyle(
                              fontSize: 36.sp,
                              color: Colors.black
                          ),
                        )),
                        Text('datetime',
                          style: TextStyle(
                              fontSize: 32.sp,
                              color: Color(0xFF380000)
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    child: Text('content',
                      style: TextStyle(
                          fontSize: 30.sp,
                          color: Colors.grey.shade800
                      ),
                    ),
                  )
                ],
              ),
            ),
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    DetailPage(),
                ));
            },
          );
        },
        separatorBuilder: (c,index){
          return Divider(height: 1.h,color: Colors.amberAccent,);
        },
        itemCount: 10,
      ),
    );
  }
}
