import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomWords(),
    );
  }
}



class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = <WordPair>{};

  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // NEW lines from here...
        builder: (BuildContext context) {
          final tiles = _saved.map(
                (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue.shade100,
              iconTheme: IconThemeData(
                  color: Colors.black
              ),
              title: Text('Saved Suggestions',
                  style: TextStyle(fontSize: 20, color: Colors.black)
              ),
            ),
            body: ListView(children: divided),
          );
        }, // ...to here.
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          centerTitle: false, //좌측정렬
          actions:[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: _pushSaved,
            )
          ],
          backgroundColor: Colors.blue.shade100,
          title:Text("218000408 Shin Yijin",
              style: TextStyle(fontSize: 20, color: Colors.black)),
        ),
        body: _buildWordList());
  }

  Widget _buildRow(WordPair pair){
    final alreadySaved = _saved.contains(pair);

    return ListTile(
      leading: Icon(
        alreadySaved ? Icons.star : Icons.star_border_outlined,
        color: alreadySaved ? Colors.yellow : null,
      ),
      title:Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      onTap: (){
        setState((){
          if(alreadySaved){_saved.remove(pair);}
          else{_saved.add(pair);}
        }
        );
      },
    );
  }

  Widget _buildWordList(){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i){
          if(i.isOdd) return Divider();
          final index = i ~/2;
          if (index >=_suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }
}

