import 'package:psico_help/app/core/enums/app_enum.dart';

class DefaultResponse<T> {
  final T object;
  final String message;
  final ResponseStatus status;

  DefaultResponse({this.object, this.message, this.status});
}