//counter을 관리하는 provider
import 'package:provider/provider.dart';
import 'package:flutter/material.dart'; //ChangeNotifiter(아마 provider)은 머터리얼이든 쿠퍼티노든 import 해줘야함.

class CounterProvider extends ChangeNotifier{ //changeNotifier을 상속받아야함.

  //이 안에 선언되어있는 변수들의 상태관리를 하는거임. 그래서 되도록 로컬변수로 만들기. 그래야지
  //겉에서 건드리는 일이 없어 안꼬임.
  int _count =0;
  int get count => _count; // 외부에서 접근이 가능하도록 get을 사용한 count 변수를 _count와 연결시켜놓기.
  void add(){
    _count++;
    notifyListeners(); //state가 변했음을 모든 listeners에게 알리기
  }

  void sub(){
    _count--;
    notifyListeners(); //state가 변했음을 모든 listeners에게 알리기
  }
}