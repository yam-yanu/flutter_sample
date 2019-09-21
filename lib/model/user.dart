import 'package:firebase/firestore.dart';

class User {
  final DocumentReference reference;
  final String name;

  User.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
      name = map['name'];

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.ref);
}
