part of company_service;

@JsonSerializable()
class CompanyUserLink {
  CompanyUserLink({
    required this.companyId,
    required this.userId,
    this.role,
  });

  factory CompanyUserLink.fromJson(Map<String, dynamic> json) =>
      _$CompanyUserLinkFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyUserLinkToJson(this);

  @JsonKey(name: "company_id")
  String companyId;

  @JsonKey(name: "user_id")
  String userId;

  @JsonKey(name: "role")
  String? role;
}
