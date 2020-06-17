import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psico_help/app/core/enums/app_enum.dart';
import 'package:psico_help/app/core/interfaces/content_repository.dart';
import 'package:psico_help/app/core/responses/response_builder.dart';
import 'package:psico_help/app/core/responses/response_default.dart';
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
      .where('active', isEqualTo: true)
      .snapshots()
      .map((query) {
        return query.documents.map((doc) {
          return Testimony.fromDocument(doc);
        }).toList();
      });
    
  }

  @override
  Future<DefaultResponse> saveTestimony(Testimony testimony) async {
    try {
      
      this.firestore.collection('testimonys')
        .document()
        .setData({
          "name": testimony.name,
          "age": testimony.age,
          "body": testimony.body,
          "testimonyDate": testimony.testimonyDate,
          "userId": testimony.userId,
          'active': testimony.active
        });

      return ResponseBuilder.success(object: ResponseStatus.Success);
      
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> sendRating(String documentId, int rating) async {
    
    try {
      Content content;
      var snapshot = await firestore.collection('contents')
        .document('$documentId')
        .get();

      content = Content.fromDocument(snapshot);
             
      int newRating = content.rating + rating;
      
      this.firestore
        .collection('contents')
        .document(documentId.toString())
        .updateData({
          'rating': newRating 
        });

        
    } catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }


  
}