import 'package:mobx/mobx.dart';
import 'package:psico_help/app/core/interfaces/content_repository.dart';
import 'package:psico_help/app/model/content.model.dart';
import 'package:psico_help/app/model/testimony.model.dart';
part 'content_controller.g.dart';

class ContentController = _ContentControllerBase with _$ContentController;

abstract class _ContentControllerBase with Store {
  final IContentRepositoty repository;

  @observable
  ObservableStream<List<Content>> contentList;

  @observable
  ObservableStream<List<Testimony>> testimonyList;

  _ContentControllerBase(this.repository){
    getContents();
    getTestimonys();
  }

  @action
  getContents(){
    contentList = repository.getContents().asObservable();
    // print(contents.data);
  }

  @action
  getTestimonys(){
    testimonyList = repository.getTestimonys().asObservable();    
    // print(contents.data);
  }

  @action
  Future setTestimony(Testimony testimony) async {
    var res = await this.repository.saveTestimony(testimony);
    return res.object;
  }

  

}