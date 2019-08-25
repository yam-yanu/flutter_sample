import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:flutter_sample/ui/atoms/skill_tag.dart';
import 'package:flutter_web/widgets.dart';

class CardActivity extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(2, 2)
          )
        ],
      ),
      child:
      Container(
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Image.asset(
                'logo.png',
                fit: BoxFit.fill,
                width: 30,
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Yu Yamamoto'),
                  Text('2019/8/19'),
                ],)
            ],),
            Text('hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge', textAlign: TextAlign.left,),
            Container(
              width: double.infinity,
              child:
              Wrap(
                direction: Axis.horizontal,
                spacing: 5,
                runSpacing: -10,
                children: <Widget>[
                  SkillTag(),
                  SkillTag(),
                  SkillTag(),
                  SkillTag(),
                ],
            )
            ),
          ],
        ),
      ),
    );
  }

}