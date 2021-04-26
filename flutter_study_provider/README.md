# flutter_study_provider

Simple counting app using Provider

## using Provider
> Provider을 사용하기 위해서는 세가지 개념을 알아야한다.
> * ChangeNotifire   
> ChangeNotifireProvider을 extends 한 class는 데이터 상태를 관리하는 class이다. 
> > <pre>
> > <code>
> >   class CounterProvider extends NotifireProvider{
> >     int _count = 0;
> >     int get count => _count; //Consumer widget을 사용하면 필요없음. provider.of 사용하면 필요할수도
> >   }
> > </code>
> > <pre>
> CounterProvider class가 NotifireProvider 을 상속받았다.   
이 클래스 내부의 variable인 _count의 상태를 관리한다. _count는 본 클래스만 접근이 가능하도록 로컬변수로 설정하는 것이 좋다. (아무곳에서나 건들이면 위험할 수 있기 때문) _count값을 다른 위젯에서 출력하거나 읽어야 하는 상황을 위해 get을 통해 count 변수를 하나 더 생성해준다.(선택적)

> * ChangeNotifireProvider
> ChangeNotifire로 raping하면 그 이하의 모든 위젯은 listener가 될 수 있다. 즉, ChangeNotifier을 상속한 클래스에서 state에 대한 변화를 일으킨 후 notifyListeners();을 실행하면 상태를 다시 그릴 수 있다는 의미. 
> > <pre>
> > <code>
> >   void main (){
> >     runApp(
> >       ChangeNotifierProvider(
> >         create: (context) => CounterProvider(); // 사용할 provider 
> >         builder: (context) => App(); //App 클래스 하위는 다 Listner 
> >       )
> >     )
> >   }
> > </code>
> > <pre>
> * Provider 에서 관리하는 variable(data)를 사용하는 방법
> > - Consumer widget
> > > Consumer widget을 사용하여 data를 읽기가 가능하다(프린트 등)
> > > <pre>
> > > <code>
> > > Widget build (BuildContext context){
> > >   ...
> > >   body : Center( 
> > >     ...
> > >     child : Consumer<CounterProvider>(
> > >      builder: (context,counter, child) { 
> > >       return Text('count: ${counter.counter}');
> > >      },
> > >     ),
> > >     ...
> > > }
> > > </code>
> > > </pre>
> > - Provider.of
> > > <pre>
> > > <code>
> > > Widget build (BuildContext context){
> > >   ...
> > >   body : Listview( 
> > >     ...
> > >     child: Text(
> > >       Provider.of<CounterProvider>(context).count.toString(), 
> > >       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
> > >     ),
> > >     ...
> > > }
