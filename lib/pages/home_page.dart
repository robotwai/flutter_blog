import 'package:flutter/material.dart';
import 'package:flutter_blog/pages/detail_page.dart';
import 'package:flutter_blog/utils/time_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';

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
      body: RefreshIndicator(child: getContent(), onRefresh: (){
        getHttp();
        return Future.value(true);
      }),
    );
  }

  Widget getContent(){
    return ListView.separated(
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
                      Expanded(child: Text(articleList[index]['article_info']['title'],
                        style: TextStyle(
                            fontSize: 36.sp,
                            color: Colors.black
                        ),
                      )),
                      Text(TimeUtil.dateToYMD(articleList[index]['article_info']['mtime']),
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
                  child: Text(articleList[index]['article_info']['brief_content'],
                    maxLines: 2,
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
                DetailPage(articleList[index]['article_id'],articleList[index]['article_info']['title']),
            ));
          },
        );
      },
      separatorBuilder: (c,index){
        return Divider(height: 1.h,color: Colors.amberAccent,);
      },
      itemCount: articleList.length,
    );
  }

  List articleList = [];
  @override
  void initState() {
    super.initState();
    getHttp();
  }

  void getHttp() async {
    try {
      var response = await Dio().post('https://api.juejin.cn/content_api/v1/article/query_list',
          data: {'user_id': "3667626519696046", 'sort_type': 2, 'cursor': "0"});

      articleList = response.data['data'];
      print(articleList[0]['']);
    } catch (e) {
      print(e);
    }
  }
}