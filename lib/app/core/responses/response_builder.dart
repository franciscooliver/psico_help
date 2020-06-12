import 'package:psico_help/app/core/responses/response_default.dart';
import 'package:psico_help/app/core/enums/app_enum.dart';

class ResponseBuilder {
  static DefaultResponse failed<T>({ T object, String message }) {
    return DefaultResponse<T>(object: object, message: message, status: ResponseStatus.Failed);
  }

  static DefaultResponse success<T>({ T object, String message }) {
    return DefaultResponse<T>(object: object, message: message, status: ResponseStatus.Success);
  }
}