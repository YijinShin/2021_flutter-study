import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Color color = Colors.black;

    //title section
    Widget titleSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Text(
                        'SHIN YI JIN',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold),

                      ),
                    ),
                    Text(
                      '21800408',
                      style: TextStyle(color: Colors.grey[500]),
                    )
                  ],
                )
            ),
            FavoriteWidget(),
          ],
        )
    );

    //button row
    Column _buildButtonColumn(Color color, IconData icon, String lable){
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,//
        children: [
          Icon(icon, color: color),
          Container(
              margin: const EdgeInsets.only(top:8),
              child: Text(
                lable,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              )
          )
        ],
      );
    }

    //button section
    Widget buttonSection = Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.message, 'MESSAGE'),
          _buildButtonColumn(color, Icons.email, 'EMAIL'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
          _buildButtonColumn(color, Icons.description, 'ETC'),
        ],

      ),
    );

    //text section
    Widget textSection = Container(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.message,
              color: Colors.black,
              size: 40.0,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Message',
                    style: (
                        TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                  Text(
                    'Long time no see!',
                  ),
                ],
              ),
            ),
          ],
        )
    );

    //image section
    Widget imageSection = Container(
      child: Image.asset(
        'images/IMG_5900.JPG',
        width: 600,
        height: 240,
        fit: BoxFit.cover,
      ),
    );

    //Divider
    Widget divider = Divider(
      height: 10,
      thickness: 1,
      indent: 0, //앞쪽 길이
      endIndent: 0, //뒤쪽 길이
      color: Colors.black,

    );

    return MaterialApp(
        title: 'Flutter layout demo',
        theme: ThemeData(primarySwatch: Colors.blue,),
        home: Scaffold(
          //body: Column( //작은 디바이스에서 스크롤이 가능하도록 listview로 바꿈
          body: ListView(
            children: [
              imageSection,
              titleSection,
              divider,
              buttonSection,
              divider,
              textSection,
            ],
          ),
        )
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount =41;

  void _toggleFavorite(){
    setState(() {
      if(_isFavorited){
        _favoriteCount -=1;
        _isFavorited = false;
      }
      else{
        _favoriteCount +=1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.yellow[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
            width: 18,
            child: Container(
              child: Text(
                '$_favoriteCount',
                style: TextStyle(color: Colors.black),
              ),
            )
        ),
      ],
    );
  }
}
