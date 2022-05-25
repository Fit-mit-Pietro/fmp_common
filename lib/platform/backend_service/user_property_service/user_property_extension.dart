
part of user_property_service;



extension UserPropertyParser on UserProperty {

  static UserProperty fromAPIUserProperty(API.UserProperty element) => UserProperty(
    label: element.label,
    id: element.id,
    propertyType: fromAPIType( element.type),
    propertyOptions: ObjectToMap(element.propertyOptions),
    unit: element.unit
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

  API.UserProperty toAPIUserProperty() => API.UserProperty(
    label: this.label,
    type: fromServiceType(this.propertyType),
    id: this.id,
    propertyOptions: this.propertyOptions,
    unit: this.unit
  );

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

extension APIUserPropertyParser on API.UserProperty {

  static API.UserProperty fromServiceUserProperty(UserProperty element)
  => element.toAPIUserProperty();

  UserProperty toServiceUserProperty()
  => UserPropertyParser.fromAPIUserProperty(this);

}