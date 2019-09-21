import 'package:firebase/firestore.dart';
import 'package:flutter_sample/model/skill.dart';
import 'package:flutter_sample/model/user.dart' as UserModel;

class Activity {
  final DocumentReference reference;
  final String content;
  final DateTime createdAt;
  final UserModel.User userMain;
  final List<Skill> skillNeeds;

  Activity.fromMap(
    this.reference, Map<String, dynamic> map,
    List<Skill> this.skillNeeds, UserModel.User this.userMain
  ):
    assert(map['content'] != null),
    content = map['content'],
    createdAt = map['createdAt'];

  Activity.fromSnapshot(
      DocumentSnapshot snapshot,
      List<Skill> skillNeeds, UserModel.User userMain
  ): this.fromMap(snapshot.ref, snapshot.data(), skillNeeds, userMain);

  // TODO debugなしでプロパティ見れるようにする
  void debug() {
    print(this.reference.id);
    print(this.skillNeeds);
    print(this.content);
  }

  Map toMap() {
    return {
      'content': this.content,
      'createdAt': this.createdAt,
    };
  }

}
