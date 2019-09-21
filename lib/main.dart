// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_sample/bloc/activity.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'flutter_staggerd_grid_view/widgets/staggered_grid_view.dart';
import 'flutter_staggerd_grid_view/widgets/staggered_tile.dart';
import 'ui/templates/general.dart';
import 'ui/organisms/header.dart' as organismsHeader;
import 'ui/molecules/card_activity.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter_sample/model/activity.dart';

void main() {
  initializeApp(
    // TODO ここをうまく入れ込む方法を考える
    apiKey: '',
    databaseURL: '',
    projectId: '',
    storageBucket: '',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'actice',
      home: General(
        header: organismsHeader.Header(),
        left_bar: Container(
          width: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(right: BorderSide(color: Colors.black26))
          ),
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
        main: Container(
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
                width: 900,
                padding: EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.center,
                child: _buildBody(context)
              )
            ),
          ]),
        ),
      ),
    );
  }

   Widget _buildBody(BuildContext context) {
     return StreamBuilder<List<Activity>>(
       stream: ActivityBloc().activities,
       builder: (context, AsyncSnapshot<List<Activity>> snapshot) {
         if (!snapshot.hasData) return LinearProgressIndicator();
         return _buildStaggeredGridView(context, snapshot.data);
       },
     );
   }

   Widget _buildStaggeredGridView(BuildContext context, List<Activity> activities) {
     return StaggeredGridView.extentBuilder(
       maxCrossAxisExtent: 300,
       itemCount: activities.length,
       itemBuilder: (ContextAttributes, index) {
         return CardActivity(activity: activities[index]);
       },
       mainAxisSpacing: 10,
       crossAxisSpacing: 20,
       staggeredTileBuilder: (index) => StaggeredTile.fit(1),
     );
   }

}
