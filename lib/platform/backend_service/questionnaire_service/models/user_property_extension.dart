

part of questionnaire_service;


extension ApiUserPropertyExtension on API.UserProperty{

  static API.UserProperty fromServiceProperty(UserProperty userProperty) => API.UserProperty(
    label: userProperty.label,
    type: fromServiceType(userProperty.propertyType),
    id: userProperty.id,
    propertyOptions: userProperty.propertyOptions,
  );

  UserProperty toServiceProperty() => UserProperty(
      id: this.id,
      propertyType: fromAPIType(this.type),
      label: this.label,
      propertyOptions: ObjectToMap(this.propertyOptions)
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
    }
  }

  static UserPropertyType fromAPIType(API.UserPropertyTypeEnum type){
    if(type == API.UserPropertyTypeEnum.BOOL) return UserPropertyType.BOOL;
    if(type == API.UserPropertyTypeEnum.INT) return UserPropertyType.INT;
    if(type == API.UserPropertyTypeEnum.FULL_TEXT) return UserPropertyType.FULL_TEXT;
    if(type == API.UserPropertyTypeEnum.BODY_MAP) return UserPropertyType.BODY_MAP;
    if(type == API.UserPropertyTypeEnum.ENUM) return UserPropertyType.ENUM;
    throw UnimplementedError();
  }
}

extension ServiceUserPropertyExtension on UserProperty{

  static UserProperty fromAPIProperty(API.UserProperty userProperty)
  => userProperty.toServiceProperty();

  API.UserProperty toAPIProperty(){
    return ApiUserPropertyExtension.fromServiceProperty(this);
  }
}