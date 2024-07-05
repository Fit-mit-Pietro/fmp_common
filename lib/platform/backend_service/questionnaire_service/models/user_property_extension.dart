part of questionnaire_service;

extension ApiUserPropertyExtension on API.UserProperty {
  static API.UserProperty toServiceProperty(UserProperty userProperty) =>
      API.UserProperty(
        label: userProperty.label,
        type: fromServiceType(userProperty.propertyType),
        id: userProperty.id,
        propertyOptions: userProperty.propertyOptions!,
        unit: userProperty.unit!,
        minValue: userProperty.minValue!,
        maxValue: userProperty.maxValue!,
      );

  UserProperty fromServiceProperty() => UserProperty(
        id: id,
        propertyType: fromAPIType(type),
        label: label,
        propertyOptions: objectToMap(propertyOptions),
        unit: unit,
        minValue: minValue,
        maxValue: maxValue,
      );

  static Map<String, String>? objectToMap(Object object) {
    try {
      Map map = jsonDecode(jsonEncode(object));
      map = map.cast<String, String>();

      if (map is Map<String, String>) return map;
    } catch (e) {
      print(e);
    }
    return null;
  }

  static API.UserPropertyTypeEnum fromServiceType(UserPropertyType type) {
    switch (type) {
      case UserPropertyType.BOOL:
        return API.UserPropertyTypeEnum.BOOL;
      case UserPropertyType.INT:
        return API.UserPropertyTypeEnum.INT;
      case UserPropertyType.FULL_TEXT:
        return API.UserPropertyTypeEnum.FULL_TEXT;
      case UserPropertyType.BODY_MAP:
        return API.UserPropertyTypeEnum.BODY_MAP;
      case UserPropertyType.ENUM:
        return API.UserPropertyTypeEnum.ENUM;
      case UserPropertyType.DATES_IN_WEEK:
        return API.UserPropertyTypeEnum.DATES_IN_WEEK;
    }
  }

  static UserPropertyType fromAPIType(API.UserPropertyTypeEnum type) {
    switch (type) {
      case API.UserPropertyTypeEnum.BOOL:
        return UserPropertyType.BOOL;
      case API.UserPropertyTypeEnum.INT:
        return UserPropertyType.INT;
      case API.UserPropertyTypeEnum.FULL_TEXT:
        return UserPropertyType.FULL_TEXT;
      case API.UserPropertyTypeEnum.BODY_MAP:
        return UserPropertyType.BODY_MAP;
      case API.UserPropertyTypeEnum.ENUM:
        return UserPropertyType.ENUM;
      case API.UserPropertyTypeEnum.DATES_IN_WEEK:
        return UserPropertyType.DATES_IN_WEEK;
    }
    print("Unknown type: $type");
    throw UnimplementedError();
  }
}

extension ServiceUserPropertyExtension on UserProperty {
  static UserProperty fromAPIProperty(API.UserProperty userProperty) =>
      userProperty.fromServiceProperty();

  API.UserProperty toAPIProperty() {
    return ApiUserPropertyExtension.toServiceProperty(this);
  }
}
