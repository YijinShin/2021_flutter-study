import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(
    FriendlyChatApp(),
  );
}

//ios에서
final ThemeData kIOSTheme = ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

String _name = 'Your Name';

//FriendlyChatApp
class FriendlyChatApp extends StatelessWidget {
  const FriendlyChatApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: kIOSTheme,
      home: ChatScreen(),
    );
  }
}

//ChatMessage
class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController}); // NEW
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
      axisAlignment: 0.0,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded( //긴 줄은 조정을 해줘야지 안그럼 화면 넘어가서 에러남. expanded로 묶어주면 됨.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, //왼쪽 정렬
                children: [
                  Text(
                    _name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Container(margin: EdgeInsets.only(top: 5.0), child: Text(text)),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  child: Text(_name[0]),
                )
            ),
          ],
        ),
      ),
    );
  }
}

// ChatScreen
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  //chatMessage 객체의 list 생성
  final List<ChatMessage> _messages = [];

  //textEditingController 생성
  final _textController = TextEditingController();

  //focus 객체 생성
  final FocusNode _focusNode = FocusNode();

  //입력중인지 아닌지 기록
  bool _isComposing= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FriendlyChat'),
          elevation:  0.0,
        ),
        body: Column(
          children: [
            Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  reverse: true, //listview가 밑에서 부터 자라도록
                  itemBuilder: (_, int index) => _messages[index],
                  itemCount: _messages.length,
                )
            ),
            Divider(
              height: 1.0,
            ),
            Container(
              decoration:
              BoxDecoration(color: Theme.of(context).cardColor), // NEW
              child: _buildTextComposer(),
            ),
          ],
        ));
  }

  //TextFiled section
  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController, //입력하는 text를 받아온다.
                onChanged: (String text){
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted:
                _handleSubmitted, //text를 보내면 _handleSubmitted 를 사용한다.
                decoration: InputDecoration.collapsed(
                    hintText: 'Send a message.'), //아무것도 입력하지 않았을 때 보여지는 문자.
                focusNode: _focusNode, // focus node 설정
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: _isComposing ? const Icon(Icons.directions_run) : const Icon(Icons.directions_walk ),
                  onPressed:_isComposing ?  () => _handleSubmitted(_textController.text) : null, //입력하는게 하나도 없으면 send버튼을 클릭안되도록.
                )
            ),
          ],
        ),
      ),
    );
  }

  //text를 send하면 작동
  void _handleSubmitted(String text) {
    _textController.clear();
    //clear를 해주면 필드가 비니까 incomposing을 false로 해줘야함.
    setState(() {                             // NEW
      _isComposing = false;                   // NEW
    });

    //ChatMessage 객체 생성, 초기화
    ChatMessage message = ChatMessage(
        text: text,
        animationController: AnimationController(
          duration: const Duration(milliseconds: 3000),
          vsync: this,
        )
    ); //입력받은 text전달
    setState(() {
      _messages.insert(0, message); //message list 비우기..가 아니라 chatMessage 리스트에 만든 chatMessage 객체 하나를 넣은거같은데 왜 index가 0인지는 모르겠어.
    });
    _focusNode.requestFocus(); //포커스노드 설정
    message.animationController.forward();
  }

  @override
  void dispose() {
    for (var message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
