

import 'package:fmp_common/platform/keys/keys.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {


  @JsonKey(name: Keys.USER_EMAIL)
  final String email;

  @JsonKey(name: Keys.USER_USER_NAME)
  final String username;

  @JsonKey(name: Keys.USER_FAMILY_NAME)
  final String familyName;

  @JsonKey(name: Keys.USER_FIRST_NAME)
  final String firstName;

  User({required this.email,required this.username,required this.familyName,required this.firstName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}