// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_property_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProperty _$UserPropertyFromJson(Map<String, dynamic> json) => UserProperty(
      id: json['id'] as String,
      label: json['label'] as String,
      propertyType: $enumDecode(_$UserPropertyTypeEnumMap, json['type']),
      propertyOptions: (json['property_options'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      unit: json['unit'] as String?,
      minValue: (json['min_value'] as num?)?.toInt(),
      maxValue: (json['max_value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserPropertyToJson(UserProperty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'type': _$UserPropertyTypeEnumMap[instance.propertyType]!,
      'property_options': instance.propertyOptions,
      'unit': instance.unit,
      'min_value': instance.minValue,
      'max_value': instance.maxValue,
    };

const _$UserPropertyTypeEnumMap = {
  UserPropertyType.BOOL: 'BOOL',
  UserPropertyType.INT: 'INT',
  UserPropertyType.FULL_TEXT: 'FULL_TEXT',
  UserPropertyType.BODY_MAP: 'BODY_MAP',
  UserPropertyType.ENUM: 'ENUM',
  UserPropertyType.DATES_IN_WEEK: 'DATES_IN_WEEK',
};
