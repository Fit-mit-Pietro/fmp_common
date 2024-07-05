


import 'package:fmp_common/platform/backend_service/filter/filter_lib.dart';

class FilterWidgetFunctions{

  String getLabelOfOperation(FilterOperation operation){
    switch(operation){

      case FilterOperation.equal:
        return "ist";
      case FilterOperation.notEqual:
        return "ist nicht";

      case FilterOperation.lower:
        return "kleiner als";

      case FilterOperation.higher:
        return "größer als";

      case FilterOperation.contains:
        return "enthält";
    }
  }

}