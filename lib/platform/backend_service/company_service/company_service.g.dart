// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      id: json['id'] as String,
      label: json['text'] as String,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.label,
    };
