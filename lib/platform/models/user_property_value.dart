

import 'package:flutter/cupertino.dart';
import 'package:fmp_common/platform/backend_service/user_property_service/user_property_service.dart';

class UserPropertyValue{

  late UserProperty _property;
  UserProperty get property => _property;

  dynamic _value;

  UserPropertyValue({
    required UserProperty property,
    required dynamic value,
  }){
    _property = property;
    _value = value;
  }
}