// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'actice',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
              children: [
                Image.asset(
                  'logo.png',
                  width: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'actice',
                  style: TextStyle(
                      color: Colors.lightBlue, fontFamily: 'Comfortaa'),
                )
              ],
            ),
            elevation: 1,
          ),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 250.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(right: BorderSide(color: Colors.black26))),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black26))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('teams'),
                          TextField(),
                          Container(
                            height: 100,
                            child: ListView(
                              children: <Widget>[
                                ListTile(
                                  title: Text('hoge'),
                                ),
                                ListTile(
                                  title: Text('hoge'),
                                ),
                                ListTile(
                                  title: Text('hoge'),
                                ),
                                ListTile(
                                  title: Text('hoge'),
                                ),
                              ],
                            )
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('members'),
                          TextField(),
                          Container(
                              height: 100,
                              child: ListView(
                                children: <Widget>[
                                  ListTile(
                                    title: Text('hoge'),
                                  ),
                                  ListTile(
                                    title: Text('hoge'),
                                  ),
                                  ListTile(
                                    title: Text('hoge'),
                                  ),
                                  ListTile(
                                    title: Text('hoge'),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white30,
              ),
            ],
          )),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
