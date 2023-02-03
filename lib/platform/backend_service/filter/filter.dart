
part of filter_lib;

enum FilterOperation {equal,notEqual,lower,higher,contains}

class Filter{

  static const String NO_POSSIBLE_FIELD_ID = "NO_POSSIBLE_FIELD_ID";
  late Field _selectedField;
  late List<Field> _possibleFields;
  dynamic value;
  late FilterOperation selectedFilterOperation;

  set possibleFields(List<Field> fields){
    _possibleFields = fields;
  }

  List<Field> get possibleFields => _possibleFields;

  List<Field> getPossibleAndSelectedField(){
    List<Field> fields = List.from(_possibleFields);

    // it could be, that the currently selected field is not in the possible fields anymore
    Field? selectedInPossible = fields.firstWhereOrNull((f)=> f.id == _selectedField.id);
    // if this is the case, we will add the field only for the getter
    if(selectedInPossible == null){
      fields.add(_selectedField);
    }

    return fields;
  }

  void setSelectedField(Field field){
    _selectedField = field;
  }

  Field getSelectedField(){
    return _selectedField;
  }

  Filter({
    Field? selectedField,
    required List<Field> possibleFields,
    FilterOperation? selectedFilterOperation,
    this.value,
  }){

    //assert(possibleFields.isNotEmpty,"Possible fields is not allowed to be empty");
    this._possibleFields = possibleFields;
    this._selectedField = selectedField ?? possibleFields.first;
    this.selectedFilterOperation = selectedFilterOperation ?? getAvailableOperations().first;
  }

  List<FilterOperation> getAvailableOperations(){
    Field? selectedField = getSelectedField();
    FieldValueType type = selectedField.type;
    switch(type){
      case FieldValueType.bool:
        return [
          FilterOperation.equal,
          FilterOperation.notEqual,
        ];
      case FieldValueType.int:
        return [
          FilterOperation.equal,
          FilterOperation.notEqual,
          FilterOperation.higher,
          FilterOperation.lower,
        ];
      case FieldValueType.text:
        return [
          FilterOperation.equal,
          FilterOperation.notEqual,
          //FilterOperation.contains,
        ];
      case FieldValueType.bodyMap:
        return [
          FilterOperation.equal,
          FilterOperation.notEqual,
        ];
      case FieldValueType.enumValue:
        return [
          FilterOperation.equal,
          FilterOperation.notEqual,
        ];
      case FieldValueType.datesInWeek:
        return [];
    }
  }

  @override
  String toString() {
    return 'Filter{selectedField: $_selectedField, possibleFields: $_possibleFields, value: $value, selectedFilterOperation: $selectedFilterOperation}';
  }
}