import 'package:flutter_sample/model/skill.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';

class SkillTag extends StatelessWidget {

  final Skill skill;

  SkillTag(this.skill);

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      label: Text(skill.name),
    );
  }
}
