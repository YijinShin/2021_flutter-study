import 'package:flutter/material.dart';
import 'package:flutter_study_provider/counter_provider.dart';
import 'package:provider/provider.dart';


class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        /*
        //Provider.of 를 사용
        child: Text(
          Provider.of<CounterProvider>(context).count.toString(), //get으로 선언된 count를 부른거임. count는 int니까 stirng으로 바꿈.
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        */

        //Consumer widget 을 사용
        child: Consumer<CounterProvider>(
          builder: (context, counter,_){
            return Text(
              "Total price: ${counter.count}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
    );
  }
}
