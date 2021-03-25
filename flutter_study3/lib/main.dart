//Cookbook > orientationBuilder
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  Widget portrait(){
    return Center(
      child: Text('portrait')
    );
  }

  Widget landscape(){
    return Center(
        child: Text('landscape')
    );
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text('oriantation')),
      body: OrientationBuilder(
        builder: (context,orientation){
          //시도1
          //폰을 세로로 들고있으면 이렇게 작동
          if (orientation == Orientation.portrait){
            return portrait();
          }
          //폰을 가로 들고있으면 이렇게 작동
          else{
            return landscape();
          }

          //시도2
          /*return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 2:3, //세로면 한줄row에 2개, 가로면 한row에 3개인듯.
              children: List.generate((100), (index){
                return Center(
                  child: Text(
                      'Item$index',
                      style: Theme.of(context).textTheme.headline1,
                  ),
                );
              }),
          );
           */
        },
      )
    );
  }
}
