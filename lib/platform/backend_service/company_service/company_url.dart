part of company_service;

@JsonSerializable()
class CompanyUrl {
  CompanyUrl({
    required this.companyId,
    required this.formId,
    this.url,
  });

  factory CompanyUrl.fromJson(Map<String, dynamic> json) =>
      _$CompanyUrlFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyUrlToJson(this);

  @JsonKey(name: "company_id")
  String companyId;

  @JsonKey(name: "form_id")
  String formId;

  @JsonKey(name: "url")
  String? url;
}
