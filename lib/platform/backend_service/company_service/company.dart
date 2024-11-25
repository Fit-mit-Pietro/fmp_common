part of company_service;

@JsonSerializable()
class Company implements Identifiable {
  Company({
    required this.id,
    required this.label,
    required this.description,
    required this.city,
  });

  factory Company.createNew({
    String? id,
    String label = "Neues Unternehmen",
    String description = "Eine Beschreibung des Unternehmen",
    String city = "Musterstadt",
  }) =>
      Company(
        id: IdService.getId(),
        label: label,
        description: description,
        city: city,
      );

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "name")
  String label;

  @JsonKey(name: "description")
  String description;

  @JsonKey(name: "city")
  String city;

  @override
  String getId() {
    return id;
  }

  @override
  String getLabel() {
    return label;
  }
}
