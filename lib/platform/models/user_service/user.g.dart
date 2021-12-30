// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String,
      username: json['username'] as String,
      familyName: json['familyname'] as String,
      firstName: json['firstname'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'familyname': instance.familyName,
      'firstname': instance.firstName,
    };
