import 'package:flutter/material.dart';

//run하면 이게 제일 먼저 실행됨. 여기서 runApp에서 MyApp을 호출함. 그럼 MyApp class가 있어야겠지.)
/*
void main() {
  runApp(MyApp());
}
*/
//위에나 이거나 같음.
void main() =>runApp(MyApp());

//#1. flutter 의 대락적인 구조.+statelesswidget

//MyApp class.
class MyApp extends StatelessWidget {
  //여기서 build라는 위젯을 override하고있고,
  @override
  Widget build(BuildContext context) {
    //이 위젯은 MaterialApp을 override하고있다.
    //의미는 MaterialApp 디자인을 사용하겠다는
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home 부분이 return할 MaterialApp의 내용이라고 생각하면 된다.
      //MaterialApp디자인앱을 만드려면 반드시 그 내용을 Scacffold라는걸로 감싸줘야함.
      //(감쌀 내용을 선택하고 옵션+엔터 누르면 wrap with new widget이 나옴. 그걸로 감싸고 scaffold쓰기)
      home:
        /*Scaffold(
        //이 안에 이제 프린트 할것들을 하나하나 적어도 되고, 다른 위젯 메소드를 호출해도되고. (일반적으로는 호출함)
        //여기에 직접 프린트 할 것들을 호출하는 방법
          appBar: AppBar(
            // 앞에 appBer는 '속성'이고, 그 속성 안에 있는 AppBar'위젯'을 사용하는 것. 노란글씨는 위젯이라고 생각하면 좋을 듯.
            title:Text('hello world'),
          ),
          body: Text('hello', style:TextStyle(fontSize: 30),)

      ),*/
      //stateful widget을 사용하기 위해 밑에 정의한 MyApp2를 호출
        MyApp2("hello world"),
    );
  }
}


//#2. stateful Widget

//위에서 본 MyApp은 StatelessWidget을 상속받음. 즉 화면이 절대 바뀌지 않음.
//이번에는 화면에 변화가 있는 stateful widget을 사용해볼 것임.
//그냥 아무것도 없는 곳에 stful이라고 치고 엔터 누르면 이렇게 stateful을 상속받고있는 클래스 두개가 생성됨. 이름 지어주기
//이름은 stful하고 바로 쓰면 자동적으로 다 적용이 되고, 만약에 안되면 그냥 따로 쓰기 _State라고되어있는 부분 다 _'이름'State로 바꾸고, State<'이름'> 넣기
class MyApp2 extends StatefulWidget {
  final String title ; //여기서 정의 되는 것들은 다 final로 해야함.
  MyApp2(this.title); //초기화를 해야하므로 생성자를 만들어준다. (generate 메뉴는 커멘드n 누르면됨> constructor)

  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  //stateless에서 build와 같다. return에 마찬가지로 화면 그려주면됨. 
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("stateful")),
        body: Text(widget.title, style: TextStyle(fontSize: 30))
    );//여서 widget.title은 MyApp2 class를 참조한다. 거기에 정의되어있는 title을 가져오라는 의미
  }
}
/*hw1에 list tile안의 배열 관련 필기
leading : Icon 은 text앞에 오는 아이콘
trailing:Icon은 text뒤에 오는 아이콘*/


/*11일 수업
 var map2 = {key:value} 이게 map타입
 value안에는 list, object 등등 다양한게 들어갈수있음.

 named parameter
 함수에서 parameter이름을 적을수있음. (머야)

 그냥 dart 읽어봐
 https://dart.dev/guides/language/language-tour

 => 이건 한줄짜리 함수 쓸때 이걸로 씀. 한줄쓰는데 괄호 쓰기 귀찮다 이거지.

 var list = ['apples', 'bananas', 'oranges'];
list.forEach((item) {
  print('${list.indexOf(item)}: $item');
});
여기서 forEach라는 함수의 파라미터로 item이라는 함수를 보내지.
그리고 item이라는 함수는 anonymous function이다. 이름이 없는 거래.. item이 이름이 아닌가.그냥 위에 따로 선언할 필요 없단말인듯.

a??b  : a가 null이면 b를 넣어줌

assert함수 : 디버깅할때 쓰는 함수. 당연히 디버그 모드일때만 작동한다. 앱스토어에서 사용자가 쓸때는 다 빠짐
assert(text != null); 프린트로 디버깅하는 대신 이걸로 디버깅해. 해당 조건에 걸리면 익셉션 띄움

Cascade notation '?.'
p?.y =4; 이건 p가 null이 아닐 에 의미 다시 찾기

named constructor(생성자.) 생성자인데 별도의 이름을 줘서 만들수있음.
아직 유용성을 잘 모르겠다. 정확히 어떤 상황에서 쓰는지 알자.
근데 우리가 만들일은 거의 없을거래

mixin 이라는 컨셉이 있다.
부모를 여러명두는 단점을 보완하면서도 부모를 한개만 둘수있을 때의 한계를 극복하기 위해 만듬.
extends 부모 with 가져올코드.. 대충 이렇게 쓴대. 한번 읽어봐 레퍼런스

class m (){
    ...a
}
class n extend 부모 with a{
}

이렇게 하는거같아.

generics

abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}
이게 제너릭 사용한 결과 (레퍼런스에 왜 제너릭을 사용하는지 나옴)

비동기식 코드 (asynchrony support) 이것도 레퍼런스 찾아봐 근데 재밌을 거같아 찾아봐

suppot notnull safety 이것도 레퍼런스 읽어봐
 */