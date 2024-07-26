part of filter_lib;

// extension ServiceFilterParser on Filter {

//   static Filter fromExerciseAPIFilter(ExerciseApi.Filter element) => Filter(
//     possibleFields: [element.field.toServiceField()],
//       selectedField: element.field.toServiceField(),
//     selectedFilterOperation: fromAPIType(element.operation),
//     value: _castFromApiValue(element.propertyValue, element.field.toServiceField())
//   );

//   static dynamic _castFromApiValue(String value,Field field){
//     switch(field.type){

//       case FieldValueType.bool:
//         int index = int.tryParse(value) ?? 0;
//         return index == 0? false: true;
//       case FieldValueType.int:
//         return int.tryParse(value);
//       case FieldValueType.text:
//         return value;
//       case FieldValueType.bodyMap:
//         return value;
//       case FieldValueType.enumValue:
//         return value;
//     }
//   }

//   static dynamic _castFromServiceValue(dynamic value,Field field){
//     switch(field.type){

//       case FieldValueType.bool:
//         bool b = value as bool;
//         return b==false? "0":"1";

//       case FieldValueType.int:
//         return value.toString();
//       case FieldValueType.text:
//         return value.toString();
//       case FieldValueType.bodyMap:
//         return value.toString();
//       case FieldValueType.enumValue:
//         return value.toString();

//     }
//   }

//   ExerciseApi.Filter toExerciseAPIFilter() => ExerciseApi.Filter(
//     field: this.getSelectedField().toExerciseApiField(),

//     operation: exerciseFromServiceType(this.selectedFilterOperation),
//     propertyValue: _castFromServiceValue(this.value,this.getSelectedField()),

//   );

//   static ExerciseApi.FilterOperationEnum exerciseFromServiceType(FilterOperation type){
//     switch(type){

//       case FilterOperation.equal:
//         return ExerciseApi.FilterOperationEnum.equal;

//       case FilterOperation.notEqual:
//         return ExerciseApi.FilterOperationEnum.notEqual;

//       case FilterOperation.lower:
//         return ExerciseApi.FilterOperationEnum.lower;

//       case FilterOperation.higher:
//         return ExerciseApi.FilterOperationEnum.higher;

//       case FilterOperation.contains:
//         return ExerciseApi.FilterOperationEnum.contains;
//     }
//   }
//   /*
//   static const equal = FilterOperationEnum._(r'equal');
//   static const notEqual = FilterOperationEnum._(r'notEqual');
//   static const lower = FilterOperationEnum._(r'lower');
//   static const higher = FilterOperationEnum._(r'higher');
//   static const contains = FilterOperationEnum._(r'contains');
//    */

//   static FilterOperation fromAPIType(ExerciseApi.FilterOperationEnum type){
//     if(type == ExerciseApi.FilterOperationEnum.equal) return FilterOperation.equal;
//     if(type == ExerciseApi.FilterOperationEnum.notEqual) return FilterOperation.notEqual;
//     if(type == ExerciseApi.FilterOperationEnum.lower) return FilterOperation.lower;
//     if(type == ExerciseApi.FilterOperationEnum.higher) return FilterOperation.higher;
//     if(type == ExerciseApi.FilterOperationEnum.contains) return FilterOperation.contains;
//     throw UnimplementedError();
//   }


// }

// extension ExcerciseAPIFilterParser on ExerciseApi.Filter {

//   static ExerciseApi.Filter fromServiceFilter(Filter element)
//   => element.toExerciseAPIFilter();

//   Filter toServiceFilter()
//   => ServiceFilterParser.fromExerciseAPIFilter(this);

// }