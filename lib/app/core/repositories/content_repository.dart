import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psico_help/app/core/interfaces/content_repository.dart';
import 'package:psico_help/app/model/content.model.dart';
import 'package:psico_help/app/model/testimony.model.dart';

class ContentRepository implements IContentRepositoty {

  final Firestore firestore;

  ContentRepository(this.firestore);

  @override
  Stream<List<Content>> getContents() {
    // Retornando os conteúdos do firebase  
    return firestore.collection('contents')
      .snapshots()
      .map((query) {
        return query.documents.map((doc) {
          return Content.fromDocument(doc);
        }).toList();
      });
  }

  @override
  Stream<List<Testimony>> getTestimonys() {
    // Retornando os conteúdos do depoimentos  
    print('getTestimonys repository');
    return firestore.collection('testimonys')
      .snapshots()
      .map((query) {
        return query.documents.map((doc) {
          return Testimony.fromDocument(doc);
        }).toList();
      });
    
  }
  
}