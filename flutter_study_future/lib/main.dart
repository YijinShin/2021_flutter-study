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
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Future<int> number(){
  int number = 1000;
  return Future<int>.delayed(Duration(seconds: 20),(){
    return number;
  });
}

Widget printNumber

class _HomeState extends State<Home> {

  Future<int> num = number(); //5초 뒤에 완료
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future"),
      ),
      body: Center(
        child: Text(
          'num : $num',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
