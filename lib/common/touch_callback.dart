//触摸回调列表 封装触摸回响
import 'package:flutter/material.dart';

//触摸回调组件
class TouchCallback extends StatefulWidget{
  //子组件
  final Widget child;
  //回调函数
  final VoidCallback onpressed;
  final bool isfeed;
  //背景色
  final Color background;

  //传入参数列表
  const TouchCallback({Key key,
    @required this.onpressed,
    this.isfeed = true,
    this.background:const Color(0xffd8d8d8),
    @required this.child}) : super(key: key);

  @override
  State createState() => TouchState();

}

class TouchState extends State<TouchCallback>{
  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    // 返回GestureDetector对象
    return GestureDetector(
      //使用Container 容器包裹
      child: Container(
        color: color,
        child: widget.child,
      ),
      onTap: widget.onpressed,
      onPanDown: (d){
        if(widget.isfeed == false)return;
        setState(() {
          color = widget.background;
        });
      },
      onPanCancel: (){
        color = Colors.transparent;
      },
    );
  }

  _getText(String text){
    //返回TEXT
    return text + 'getTEXT';
  }
}