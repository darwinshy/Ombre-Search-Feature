import 'package:cloud_firestore/cloud_firestore.dart';

class Events {
  final String title;
  final String subtitle;
  final String image;
  final DocumentReference reference;

  Events.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map['title'],
        subtitle = map['subtitle'],
        image = map["image"];

  Events.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}
