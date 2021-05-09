import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DetailPage extends StatefulWidget{

  String id;
  String title;

  DetailPage(this.id, this.title);

  @override
  State createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage>{
  WebViewXController webviewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.title}',
          style: TextStyle(
              fontSize: 36.sp,
              color: Colors.white
          ),
        ),
      ),
      body: WebViewX(
        onWebViewCreated: (controller) => webviewController = controller,
        initialContent: 'https://juejin.cn/post/6959183546900545567',
        initialSourceType: SourceType.URL,
        onPageFinished: (url){

        },
      ),
    );
  }

  @override
  void dispose() {
    webviewController?.dispose();
    super.dispose();
  }
}