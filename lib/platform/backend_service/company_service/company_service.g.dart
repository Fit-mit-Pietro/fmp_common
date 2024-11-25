// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      id: json['id'] as String,
      label: json['name'] as String,
      description: json['description'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.label,
      'description': instance.description,
      'city': instance.city,
    };

CompanyUrl _$CompanyUrlFromJson(Map<String, dynamic> json) => CompanyUrl(
      companyId: json['company_id'] as String,
      formId: json['form_id'] as String,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$CompanyUrlToJson(CompanyUrl instance) =>
    <String, dynamic>{
      'company_id': instance.companyId,
      'form_id': instance.formId,
      'url': instance.url,
    };

CompanyUserLink _$CompanyUserLinkFromJson(Map<String, dynamic> json) =>
    CompanyUserLink(
      companyId: json['company_id'] as String,
      userId: json['user_id'] as String,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$CompanyUserLinkToJson(CompanyUserLink instance) =>
    <String, dynamic>{
      'company_id': instance.companyId,
      'user_id': instance.userId,
      'role': instance.role,
    };
