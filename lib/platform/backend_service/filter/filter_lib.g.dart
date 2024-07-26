// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_lib.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Field _$FieldFromJson(Map<String, dynamic> json) => Field(
      type: $enumDecode(_$FieldValueTypeEnumMap, json['type']),
      label: json['label'] as String,
      id: json['id'] as String,
      enumValues: (json['property_options'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$FieldToJson(Field instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$FieldValueTypeEnumMap[instance.type]!,
      'label': instance.label,
      'property_options': instance.enumValues,
    };

const _$FieldValueTypeEnumMap = {
  FieldValueType.bool: 'BOOL',
  FieldValueType.int: 'INT',
  FieldValueType.text: 'TEXT',
  FieldValueType.bodyMap: 'BODY_MAP',
  FieldValueType.$enum: 'ENUM',
  FieldValueType.datesInWeek: 'DATES_IN_WEEK',
};

Filter _$FilterFromJson(Map<String, dynamic> json) => Filter(
      possibleFields: (json['possibleFields'] as List<dynamic>?)
              ?.map((e) => Field.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      selectedFilterOperation:
          $enumDecodeNullable(_$FilterOperationEnumMap, json['operation']),
      value: json['value'],
    );

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'value': instance.value,
      'operation': _$FilterOperationEnumMap[instance.selectedFilterOperation]!,
      'possibleFields': instance.possibleFields,
    };

const _$FilterOperationEnumMap = {
  FilterOperation.equal: 'equal',
  FilterOperation.notEqual: 'notEqual',
  FilterOperation.lower: 'lower',
  FilterOperation.higher: 'higher',
  FilterOperation.contains: 'contains',
};
