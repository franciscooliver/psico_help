import 'package:psico_help/app/core/responses/response_default.dart';
import 'package:psico_help/app/model/content.model.dart';
import 'package:psico_help/app/model/testimony.model.dart';

abstract class IContentRepositoty {
  Stream<List<Content>> getContents();
  Stream<List<Testimony>> getTestimonys();
  Future<DefaultResponse> saveTestimony(Testimony testimony);
  Future<DefaultResponse> sendRating(String documentId, int rating);
}