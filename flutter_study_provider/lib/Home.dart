import 'package:flutter/material.dart';
import 'package:flutter_study_provider/CounterWidget.dart';
import 'package:flutter_study_provider/counter_provider.dart';
import "package:provider/provider.dart";

//provider을 사용하면 stful widget을 거의 안사용해도괜찮
class Home extends StatelessWidget {

  CounterProvider _counterProvider;

  @override
  Widget build(BuildContext context) {
    _counterProvider = Provider.of<CounterProvider>(context); //provider 불러들이는 방법
    return Scaffold(
      appBar: AppBar(
        title: Text("counter with provider"),
      ),
      body: CounterWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                _counterProvider.add();
              }
          ),
          IconButton(
              icon: Icon(Icons.remove),
              onPressed: (){
                _counterProvider.sub();
              }
          )
        ],
      ),
    );
  }
}
