import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String documentId;
  String name;
  String email;
  String password;
  bool isAdmin;
  // final DocumentReference reference;

  User({this.documentId, this.name, this.email, this.password, this.isAdmin});

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      name: doc['name'], 
      email: doc['email'],
      password: doc['password'],
      isAdmin: doc['isAdmin'],
      documentId: doc.documentID
    );
  }
  
toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'isAdmin': isAdmin,
    };
  }
}