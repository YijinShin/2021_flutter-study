//Cookbook >desing> drawer ,snackbar, custom theme

//Design>fonts 는 안했다.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //theme : 기존의 theme사용.
        //primarySwatch: Colors.blue,
        //theme : 직접 설정
          //전반적인 color 설정
        brightness: Brightness.dark, //페이지 배경색
        primaryColor: Colors.lightGreen, //앱바 색.
        accentColor: Colors.pink,
          //text theme 설정
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 15.0, fontFamily: 'Hind'),
        ),
        //이렇게 설정한 theme은 밑에서 참조해서 그 theme 색을 사용할 수 있음. (예를들어 snackbar button 색 정하는 코드를 봐라.)
      ),

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title ;
  MyHomePage({Key key, this.title}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      //appbar 생성
      appBar: AppBar(title: Text('MainPage'),),
      //body에 text,가운데 정렬
      body: Center(
        child: Row(//center children사용이 불가하므 택스트와 버튼을 모두 넣기 위해 row를 사용하자)
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //row 를 화면에 맞게 가운데 부분에 놓는 정
          children: <Widget>[
            Text("body"),
            ElevatedButton(
              child: Container( //ElevatedButton안에 children이 불가능한데 text랑 color지정 둘다 넣고싶어서 child안에 컨테이너를 넣고 둘다 그 안에 넣음.
                child:
                  Text('snakbar button',
                    style: Theme.of(context).textTheme.headline6, //위에서 지정한 theme의 textTheme의 headline6 스타일을 받아옴.
                  ),
                color: Theme.of(context).accentColor, //위에서 지정한 theme의 accentcolor색을 받아옴.
              ),
              onPressed:(){
                //스낵바객체생성
                final snackBar = SnackBar(
                    content: Text('SnackBar!'),
                    action: SnackBarAction(
                      label: 'undo',
                      onPressed: (){}, //undo 누르면 하는 동작
                    ),
                );
                //만든 스낵바객체 화면에 보이게 하기
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            )
          ]
        )
      ),
      //drawer생성
      drawer: Drawer(), //생성만 하면 일단 main page 우측에 drawer icon이 생기고, 누르면 빈 화면이 나옴. 기본사이즈가 가로가 약간 짧음
      endDrawer: Drawer(//오른쪽에서 나오는 drawer
        child: ListView( //child에 리스트뷰를 넣기로 했다.
          padding: EdgeInsets.zero, //drawer의 헤더박스가 화면끝까지 찬다. 이거 없으면 위에 흰 부분이 남음
          children: <Widget>[
            DrawerHeader(
              child: Text('drawer header'),
              decoration: BoxDecoration( //drawerheader에 색을 넣거나 꾸밀수 있음.
                color: Colors.amber,
              ),
            ),
            ListTile(
              title: Text('item01'),
              onTap: (){
                Navigator.pop(context); //itme01을 누르면 drawer가 닫힘. 정확히 말하면 main page로 가는듯.
              },
            ),
            ListTile(
              title: Text('item02'),
              onTap: (){},
            ),
            ListTile(
              title: Text('item03'),
              onTap: (){},
            ),
          ],
        )
      ),
    );
  }
}
