

part of questionnaire_service;


extension ApiUserPropertyExtension on API.UserProperty{

  static API.UserProperty toServiceProperty(UserProperty userProperty) => API.UserProperty(
    label: userProperty.label,
    type: fromServiceType(userProperty.propertyType),
    id: userProperty.id,
    propertyOptions: userProperty.propertyOptions,
    unit: userProperty.unit,
    minValue: userProperty.minValue,
    maxValue: userProperty.maxValue,

  );

  UserProperty fromServiceProperty() => UserProperty(
    id: this.id,
    propertyType: fromAPIType(this.type),
    label: this.label,
    propertyOptions: ObjectToMap(this.propertyOptions),
    unit: this.unit,
    minValue: this.minValue,
    maxValue: this.maxValue,
  );

  static Map<String,String>? ObjectToMap(Object object){
    if(object == null) return null;
    try{

      Map map = jsonDecode(jsonEncode(object));
      map = map.cast<String,String>();

      if(map is Map<String,String>) return map;

    }catch(e){
      print(e);
    }
  }


  static API.UserPropertyTypeEnum fromServiceType(UserPropertyType type){
    switch(type){
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

  static UserPropertyType fromAPIType(API.UserPropertyTypeEnum type){
    switch(type){
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

extension ServiceUserPropertyExtension on UserProperty{

  static UserProperty fromAPIProperty(API.UserProperty userProperty)
  => userProperty.fromServiceProperty();

  API.UserProperty toAPIProperty(){
    return ApiUserPropertyExtension.toServiceProperty(this);
  }
}