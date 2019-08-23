import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';

class CardActivity extends Container {

  final padding = EdgeInsets.only(bottom: 5);
  final decoration = BoxDecoration(
    boxShadow: [
      BoxShadow(color: Colors.grey, blurRadius: 5)
    ],
    color: Colors.black,
    borderRadius: BorderRadius.circular(5),
  );
  final child = Container(
    padding: EdgeInsets.all(10),
    color: Colors.white,
    child: Column(
      children: <Widget>[
        Row(children: <Widget>[
          Image.asset(
            'logo.png',
            fit: BoxFit.fill,
            width: 30,
            height: 30,
          ),
          Column(children: <Widget>[
            Text('Yu Yamamoto'),
            Text('2019/8/19'),
          ],)
        ],),
        Text('hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge', textAlign: TextAlign.left,),
        Flexible(child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 1,
                bottom: 1,
                left: 5,
                right: 15,
              ),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3),
                    bottomLeft: Radius.circular(3),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
              ),
              child: Text('Laravel'),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 1,
                bottom: 1,
                left: 5,
                right: 15,
              ),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3),
                    bottomLeft: Radius.circular(3),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
              ),
              child: Text('Laravel'),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 1,
                bottom: 1,
                left: 5,
                right: 15,
              ),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3),
                    bottomLeft: Radius.circular(3),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
              ),
              child: Text('Laravel'),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 1,
                bottom: 1,
                left: 5,
                right: 15,
              ),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3),
                    bottomLeft: Radius.circular(3),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
              ),
              child: Text('Laravel'),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 1,
                bottom: 1,
                left: 5,
                right: 15,
              ),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3),
                    bottomLeft: Radius.circular(3),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
              ),
              child: Text('Laravel'),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 1,
                bottom: 1,
                left: 5,
                right: 15,
              ),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3),
                    bottomLeft: Radius.circular(3),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
              ),
              child: Text('Laravel'),
            ),
          ],
        ))
      ],
    ),
  );

}