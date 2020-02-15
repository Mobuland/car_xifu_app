import 'package:flutter/material.dart';
import 'dart:async';

//加载页面
class LoadingPage extends StatefulWidget{

  @override
  _LoadingState createState() => _LoadingState();
}
class _LoadingState extends State<LoadingPage>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          //加载背景图
          Image.asset("images/maybe.jpg",fit: BoxFit.cover,)
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //在加载页面停顿3s
    Future.delayed(Duration(seconds: 3),(){
      print("Flutter 客服app实现");
      Navigator.of(context).pushReplacementNamed("app");
    });
  }

}