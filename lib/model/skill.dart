import 'package:firebase/firestore.dart';

class Skill {
  final DocumentReference reference;
  final String name;

  Skill.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        name = map['name'];

  Skill.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.ref);
}
