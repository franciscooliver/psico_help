import 'package:cloud_firestore/cloud_firestore.dart';

class Content {
  String title;
  String shortDescription;
  String content;
  int rating;
  final DocumentReference reference;

  Content({this.reference, this.title, this.shortDescription, this.content, this.rating});

  factory Content.fromDocument(DocumentSnapshot doc) {
    return Content(
      title: doc['title'], 
      shortDescription: doc['shortDescription'],
      content: doc['content'],
      rating: doc['rating'],
      reference: doc.reference
    );
  }

  // Content.fromfirestoresnapshot(DocumentSnapshot snap)
  //     : documentID = snap.documentID,
  //       title = snap.data['title'],
  //       shortDescription = snap.data['shortDescription'],
  //       content = snap.data['content'];

  toJson() {
    return {
      'title': title,
      'shortDescription': shortDescription,
      'content': content,
      'rating': rating,
    };
  }
}