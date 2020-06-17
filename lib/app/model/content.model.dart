import 'package:cloud_firestore/cloud_firestore.dart';

class Content {
  String documentId;
  String title;
  String shortDescription;
  String content;
  int rating;
  final DocumentReference reference;

  Content({this.reference, this.title, this.shortDescription, this.content, this.rating, this.documentId});

  factory Content.fromDocument(DocumentSnapshot doc) {
    return Content(
      title: doc['title'], 
      shortDescription: doc['shortDescription'],
      content: doc['content'],
      rating: doc['rating'],
      documentId: doc.documentID
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
      'documentId': documentId,
    };
  }
}