import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Testimony {
  String documentId;
  String name;
  int age;
  String body;
  String testimonyDate;


  Testimony({
    this.name,
    this.age,
    this.body,
    this.testimonyDate,
    this.documentId
  });

  factory Testimony.fromDocument(DocumentSnapshot doc) {
    return Testimony(
      name: doc['name'], 
      age: doc['age'],
      body: doc['body'],
      testimonyDate: doc['testimonyDate'],
      documentId: doc.documentID
    );
  }

  Testimony copyWith({
    String name,
    int age,
    String body,
    String testimonyDate,
  }) {
    return Testimony(
      name: name ?? this.name,
      age: age ?? this.age,
      body: body ?? this.body,
      testimonyDate: testimonyDate ?? this.testimonyDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'body': body,
      'testimonyDate': testimonyDate,
    };
  }

  static Testimony fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Testimony(
      name: map['name'],
      age: map['age'],
      body: map['body'],
      testimonyDate: map['testimonyDate'],
    );
  }

  String toJson() => json.encode(toMap());

  static Testimony fromJson(String source) => fromMap(json.decode(source));
}
