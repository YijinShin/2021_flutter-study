import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Home.dart';
import 'counter_provider.dart';
import 'CounterWidget.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: (BuildContext context) => CounterProvider(),
          child: Home(),
      ),
    );
  }
}