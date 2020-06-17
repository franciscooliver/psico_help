import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Testimony {
  String documentId;
  String name;
  int age;
  String body;
  String testimonyDate;
  String userId;
  bool active;


  Testimony({
    this.name,
    this.age,
    this.body,
    this.testimonyDate,
    this.documentId,
    this.userId,
    this.active
  });

  factory Testimony.fromDocument(DocumentSnapshot doc) {
    return Testimony(
      name: doc['name'], 
      age: doc['age'],
      body: doc['body'],
      testimonyDate: doc['testimonyDate'],
      documentId: doc.documentID,
      userId: doc['userId'],
      active: doc['active']
    );
  }

  Testimony copyWith({
    String name,
    int age,
    String body,
    String testimonyDate,
    String userId,
    bool active,
  }) {
    return Testimony(
      name: name ?? this.name,
      age: age ?? this.age,
      body: body ?? this.body,
      testimonyDate: testimonyDate ?? this.testimonyDate,
      userId: userId ?? this.userId,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'body': body,
      'testimonyDate': testimonyDate,
      'userId': userId,
      'active': active
    };
  }

  static Testimony fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Testimony(
      name: map['name'],
      age: map['age'],
      body: map['body'],
      testimonyDate: map['testimonyDate'],
      userId: map['userId'],
      active: map['active'],
    );
  }

  String toJson() => json.encode(toMap());

  static Testimony fromJson(String source) => fromMap(json.decode(source));
}
