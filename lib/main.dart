// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:english_words/english_words.dart';
import 'flutter_staggerd_grid_view/widgets/staggered_grid_view.dart';
import 'flutter_staggerd_grid_view/widgets/staggered_tile.dart';

void main() => runApp(MyApp());

const List<StaggeredTile> tiles = const <StaggeredTile>[
  const StaggeredTile.count(1, 1.5),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1.5),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1.5),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1.5),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1.5),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1.5),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1.5),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1.5),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1.5),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1.5),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1.5),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1.5),
  const StaggeredTile.count(1, 1),
];

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
                                    title: Text('hogea'),
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
                              )),
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
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    color: Colors.white30,
                    child: Column(children: [
                      Container(
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            Spacer(),
                            Text('hife'),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: StaggeredGridView.extentBuilder(
                                maxCrossAxisExtent: 400,
                                itemCount: tiles.length,
                                itemBuilder: _getChild,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 20,
                                padding: EdgeInsets.symmetric(horizontal: 100.0),
                                staggeredTileBuilder: _getStaggeredTile,
                              )
                          )
                      )
                    ])),
              ),
            ],
          )),
    );
  }

  StaggeredTile _getStaggeredTile(int i) {
    return i >= tiles.length ? null : tiles[i];
  }

  Widget _getChild(BuildContext context, int index) {
    return new Container(
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 5)
        ],
        color: Colors.black,
        borderRadius: BorderRadius.circular(5),
      ),
      child: new Container(
        color: Colors.white,
      ),
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
