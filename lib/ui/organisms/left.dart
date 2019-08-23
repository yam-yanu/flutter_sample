import 'package:flutter_web/material.dart';

class Left extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

}