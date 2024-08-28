part of company_service;

@JsonSerializable()
class Company implements Identifiable {
  Company({
    required this.id,
    required this.label,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "text")
  final String label;

  @override
  String getId() {
    return id;
  }

  @override
  String getLabel() {
    return label;
  }
}
