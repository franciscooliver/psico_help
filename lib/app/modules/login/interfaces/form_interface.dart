import 'package:flutter/cupertino.dart';
import 'package:psico_help/app/core/enums/type_fields_enums.dart';

abstract class IFormField {
  Widget formFieldBuilder({ @required TypeFields type, bool obscure});
}
