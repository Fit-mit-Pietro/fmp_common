part of user_property_service;

extension UserPropertySwaggerExtension on UserProperty {
  swagger.UserProperty toSwagger() => swagger.UserProperty(
        id: id,
        label: label,
        type: propertyType.toSwagger(),
        propertyOptions: propertyOptions,
        minValue: minValue,
        maxValue: maxValue,
        unit: unit,
      );
}

extension UserPropertyTypeSwaggerExtension on UserPropertyType {
  swagger.UserPropertyType toSwagger() => switch (this) {
        UserPropertyType.bool => swagger.UserPropertyType.bool,
        UserPropertyType.int => swagger.UserPropertyType.int,
        UserPropertyType.fullText => swagger.UserPropertyType.fullText,
        UserPropertyType.bodyMap => swagger.UserPropertyType.bodyMap,
        UserPropertyType.$enum => swagger.UserPropertyType.$enum,
        UserPropertyType.datesInWeek => swagger.UserPropertyType.datesInWeek,
      };
}

// extension UserPropertyParser on UserProperty {
//   static UserProperty fromAPIUserProperty(API.UserProperty element) =>
//       UserProperty(
//         label: element.label,
//         id: element.id,
//         propertyType: fromAPIType(element.type),
//         propertyOptions: objectToMap(element.propertyOptions),
//         unit: element.unit,
//         minValue: element.minValue,
//         maxValue: element.maxValue,
//       );

//   static Map<String, String>? objectToMap(Object? object) {
//     if (object == null) return null;
//     try {
//       Map map = jsonDecode(jsonEncode(object));
//       map = map.cast<String, String>();

//       if (map is Map<String, String>) return map;
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }

//   API.UserProperty toAPIUserProperty() {
//     return API.UserProperty(
//       label: label,
//       type: UserPropertyParser.fromServiceType(propertyType),
//       id: id,
//       propertyOptions: propertyOptions!,
//       unit: unit!,
//       minValue: minValue!,
//       maxValue: maxValue!,
//     );
//   }

//   static API.UserPropertyTypeEnum fromServiceType(UserPropertyType type) {
//     switch (type) {
//       case UserPropertyType.BOOL:
//         return API.UserPropertyTypeEnum.BOOL;
//       case UserPropertyType.INT:
//         return API.UserPropertyTypeEnum.INT;
//       case UserPropertyType.FULL_TEXT:
//         return API.UserPropertyTypeEnum.FULL_TEXT;
//       case UserPropertyType.BODY_MAP:
//         return API.UserPropertyTypeEnum.BODY_MAP;
//       case UserPropertyType.ENUM:
//         return API.UserPropertyTypeEnum.ENUM;
//       case UserPropertyType.DATES_IN_WEEK:
//         return API.UserPropertyTypeEnum.DATES_IN_WEEK;
//     }
//   }

//   static UserPropertyType fromAPIType(API.UserPropertyTypeEnum type) {
//     switch (type) {
//       case API.UserPropertyTypeEnum.BOOL:
//         return UserPropertyType.BOOL;
//       case API.UserPropertyTypeEnum.INT:
//         return UserPropertyType.INT;
//       case API.UserPropertyTypeEnum.FULL_TEXT:
//         return UserPropertyType.FULL_TEXT;
//       case API.UserPropertyTypeEnum.BODY_MAP:
//         return UserPropertyType.BODY_MAP;
//       case API.UserPropertyTypeEnum.ENUM:
//         return UserPropertyType.ENUM;
//       case API.UserPropertyTypeEnum.DATES_IN_WEEK:
//         return UserPropertyType.DATES_IN_WEEK;
//     }
//     print("Unknown type: $type");
//     throw UnimplementedError();
//   }
// }

// extension APIUserPropertyParser on API.UserProperty {
//   static API.UserProperty fromServiceUserProperty(UserProperty element) =>
//       element.toAPIUserProperty();

//   UserProperty toServiceUserProperty() =>
//       UserPropertyParser.fromAPIUserProperty(this);
// }
