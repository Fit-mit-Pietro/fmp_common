part of filter_lib;

enum FilterOperation {
  @JsonValue('equal')
  equal,

  @JsonValue('notEqual')
  notEqual,

  @JsonValue('lower')
  lower,

  @JsonValue('higher')
  higher,

  @JsonValue('contains')
  contains,
}

@JsonSerializable()
class Filter {
  static const String NO_POSSIBLE_FIELD_ID = "NO_POSSIBLE_FIELD_ID";

  @JsonKey(name: 'field')
  late Field _selectedField;

  @JsonKey(includeFromJson: false, includeToJson: false)
  late List<Field> _possibleFields;

  @JsonKey(name: 'value')
  dynamic value;

  @JsonKey(name: 'operation')
  late FilterOperation selectedFilterOperation;

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
  Map<String, dynamic> toJson() => _$FilterToJson(this);

  set possibleFields(List<Field> fields) {
    _possibleFields = fields;
  }

  @JsonKey(defaultValue: [])
  List<Field> get possibleFields => _possibleFields;

  List<Field> getPossibleAndSelectedField() {
    List<Field> fields = List.from(_possibleFields);

    // it could be, that the currently selected field is not in the possible fields anymore
    Field? selectedInPossible =
        fields.firstWhereOrNull((f) => f.id == _selectedField.id);

    // if this is the case, we will add the field only for the getter
    if (selectedInPossible == null) {
      fields.add(_selectedField);
    }

    return fields;
  }

  void setSelectedField(Field field) {
    _selectedField = field;
  }

  Field getSelectedField() {
    return _selectedField;
  }

  Filter({
    Field? selectedField,
    List<Field>? possibleFields,
    FilterOperation? selectedFilterOperation,
    this.value,
  }) {
    // TODO: Refactor this.
    // This class should never be in a state without possible fields,
    // but it is unfortunately required right now for serializing filters and sending them to the backend
    //assert(possibleFields.isNotEmpty,"Possible fields is not allowed to be empty");
    final errorField =
        Field(id: 'ERROR', label: 'ERROR', type: FieldValueType.bool);
    _possibleFields = possibleFields ?? [];
    _selectedField = selectedField ?? _possibleFields.firstOrNull ?? errorField;
    this.selectedFilterOperation =
        selectedFilterOperation ?? getAvailableOperations().first;
  }

  List<FilterOperation> getAvailableOperations() {
    Field? selectedField = getSelectedField();
    FieldValueType type = selectedField.type;
    switch (type) {
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
      case FieldValueType.$enum:
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
