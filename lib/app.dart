import 'package:flutter/material.dart';
import 'chat/message_page.dart';
import 'contacts/contacts.dart';
import 'personal/personal.dart';

//应用页面使用有状态的widget
class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  //当前选中页面索引
  var _currIndex = 0;

  //聊天页面
  MessagePage messagePage;

  //客户页面
  Contacts contacts;

  //我的页面
  Personal personal;

  currentPage(){
    switch (_currIndex){
      case 0:
        if(messagePage == null){
          messagePage = MessagePage();
        }
        return messagePage;
      case 1:
        if(contacts == null){
          contacts = Contacts();
        }
        return contacts;
      case 2:
        if(personal == null){
          personal = Personal();
        }
        return personal;
      default:
    }
  }

  //渲染某个菜单项，传入菜单标题 图片路径 图标
_PopupMenuItem(String title,{String imagePath,IconData icon}){
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          //判断是使用图片路径还是图标
          imagePath != null
          ? Image.asset(
            imagePath,
            width: 32.0,
            height: 32.0,
          )
          : SizedBox(
            width: 32.0,
            height: 32.0,
            child: Icon(
              icon,
              color: Colors.yellow,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: TextStyle(color: Colors.yellow),
            ),
          )
        ],
      ),
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('管理端'),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(
              //搜索图标
              Icons.search,
            ),
          ),
          Padding(
            //左右内边距
            padding: const EdgeInsets.only(left:30.0,right: 20.0),
            child: GestureDetector(
              onTap: (){
                //弹出菜单
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0),
                    items: <PopupMenuEntry>[
                      _PopupMenuItem('发起会话',
                      imagePath: 'images/list.png'),
                      _PopupMenuItem('添加好友',
                      imagePath: 'images/list.png'),
                      _PopupMenuItem('联系客服',
                      imagePath: 'images/list.png')
                    ]);
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //通过fixedColor 设置选中item的颜色
        type: BottomNavigationBarType.fixed,
        //当前页面索引
        currentIndex: _currIndex,
        //按下设置当前页面索引
        onTap: ((index){
          setState(() {
            _currIndex = index;
          });
        }),
        items: [
          //底部导航按钮项传入文本及图标
          BottomNavigationBarItem(
            title: Text(
              '聊天',
              style: TextStyle(
                color: _currIndex == 0 ? Colors.yellow : Color(0xff999999)
              ),
            ),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              title: Text(
                '客户',
                style: TextStyle(
                    color: _currIndex == 0 ? Colors.yellow : Color(0xff999999)
                ),
              ),
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              title: Text(
                '我的',
                style: TextStyle(
                    color: _currIndex == 0 ? Colors.yellow : Color(0xff999999)
                ),
              ),
              icon: Icon(Icons.home)
          ),
        ],
        //底部导航按钮传入文本及
      ),
      body: currentPage(),
    );
  }

}
