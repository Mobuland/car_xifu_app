import 'package:flutter/material.dart';
import 'app.dart';
import 'search.dart';
import 'loading.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: true,// 在选中模式下打开一个小的“DEBUG”横幅，表示应用程序处于选中模式
  title: "养车先生",
  theme: mDefaultTheme,//主题颜色
  //添加路由表
  routes: <String,WidgetBuilder>{
    "app": (BuildContext context) => App(),
    "/friends": (_) => WebviewScaffold(
      //webview插件
      url: "",
      appBar: AppBar(
        title: Text("交通违纪记录查询"),
      ),
      withZoom: true,
      withLocalStorage: true,
    ),
    "search": (BuildContext context) => Search(),
  },
  home: LoadingPage(),
));
final ThemeData mDefaultTheme = ThemeData(
  primaryColor: Colors.yellow,
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Colors.yellow,
);
