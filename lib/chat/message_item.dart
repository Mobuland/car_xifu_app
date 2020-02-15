import 'package:flutter/material.dart';
import 'message_data.dart';
import 'package:date_format/date_format.dart';
import 'package:car_xifu_app/common/touch_callback.dart';

class MessageItem extends StatelessWidget{
  final MessageData messageData;
  MessageItem(this.messageData);

  @override
  Widget build(BuildContext context) {
    //最外层容器
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        //加一个底边，这样整个列表的每项信息下面都会有一个编
        border: Border(bottom: BorderSide(width: 0.5,color: Color(0xffd9d9d9)))
      ),
      height: 64.0,
      //按下回调处理，空实现
      child: TouchCallback(
        onpressed: (){},
        //整体水平方向布局
        child: Row(
          //垂直方向居中显示
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //展示头像
            Container(
              //头像左右留一定的外边距
              margin: const EdgeInsets.only(left: 13.0,right: 13.0),
              child: Image.network(messageData.avatar,width: 48.0,height: 48.0,),
            ),
            Expanded(
              //主标题和子标题采用垂直布局
              child: Column(

              ),
            )
          ],
        ),
      ),
    );
  }

}