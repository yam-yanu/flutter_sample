import 'package:flutter_web/material.dart';

class Header extends AppBar {

  final backgroundColor = Colors.white;
  final elevation = 1;
  final title = Row(
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
            color: Colors.lightBlue, fontFamily: 'Comfortaa'
        ),
      )
    ],
  );

}