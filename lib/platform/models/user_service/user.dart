import 'package:fmp_common/platform/keys/keys.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: Keys.userEmail)
  final String email;

  @JsonKey(name: Keys.userUserName)
  final String username;

  @JsonKey(name: Keys.userFamilyName)
  final String familyName;

  @JsonKey(name: Keys.userFirstName)
  final String firstName;

  User(
      {required this.email,
      required this.username,
      required this.familyName,
      required this.firstName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
