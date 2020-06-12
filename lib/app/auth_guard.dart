import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard implements RouteGuard {
  
  @override
  bool canActivate(String url) {
    if (url != '/content'){
    
      return true;
    
    }else {
      return false;
    }
  }

  @override
  List<GuardExecutor> get executors => [];
}