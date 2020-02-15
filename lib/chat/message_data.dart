//消息类型
enum MessageType {SYSTEM,PUBLIC,CHAT,GROUP}

class MessageData{
  //头像
  String avatar;
  //主标题
  String title;
  //子标题
  String subTitle;
  //消息时间
  DateTime time;
  //消息时间
  MessageType messageType;

  MessageData(this.avatar, this.title, this.subTitle, this.time, this.messageType);

}