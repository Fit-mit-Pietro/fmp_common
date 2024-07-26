part of questionnaire_service;

// extension ApiUserPropertyExtension on api.UserProperty {
//   static api.UserProperty toServiceProperty(UserProperty userProperty) =>
//       api.UserProperty(
//         label: userProperty.label,
//         type: fromServiceType(userProperty.propertyType),
//         id: userProperty.id,
//         propertyOptions: userProperty.propertyOptions!,
//         unit: userProperty.unit!,
//         minValue: userProperty.minValue!,
//         maxValue: userProperty.maxValue!,
//       );

//   UserProperty fromServiceProperty() => UserProperty(
//         id: id,
//         propertyType: fromAPIType(type),
//         label: label,
//         propertyOptions: objectToMap(propertyOptions),
//         unit: unit,
//         minValue: minValue,
//         maxValue: maxValue,
//       );

//   static Map<String, String>? objectToMap(Object object) {
//     try {
//       Map map = jsonDecode(jsonEncode(object));
//       map = map.cast<String, String>();

//       if (map is Map<String, String>) return map;
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }

//   static api.UserPropertyTypeEnum fromServiceType(UserPropertyType type) {
//     switch (type) {
//       case UserPropertyType.BOOL:
//         return api.UserPropertyTypeEnum.BOOL;
//       case UserPropertyType.INT:
//         return api.UserPropertyTypeEnum.INT;
//       case UserPropertyType.FULL_TEXT:
//         return api.UserPropertyTypeEnum.FULL_TEXT;
//       case UserPropertyType.BODY_MAP:
//         return api.UserPropertyTypeEnum.BODY_MAP;
//       case UserPropertyType.ENUM:
//         return api.UserPropertyTypeEnum.ENUM;
//       case UserPropertyType.DATES_IN_WEEK:
//         return api.UserPropertyTypeEnum.DATES_IN_WEEK;
//     }
//   }

//   static UserPropertyType fromAPIType(api.UserPropertyTypeEnum type) {
//     switch (type) {
//       case api.UserPropertyTypeEnum.BOOL:
//         return UserPropertyType.BOOL;
//       case api.UserPropertyTypeEnum.INT:
//         return UserPropertyType.INT;
//       case api.UserPropertyTypeEnum.FULL_TEXT:
//         return UserPropertyType.FULL_TEXT;
//       case api.UserPropertyTypeEnum.BODY_MAP:
//         return UserPropertyType.BODY_MAP;
//       case api.UserPropertyTypeEnum.ENUM:
//         return UserPropertyType.ENUM;
//       case api.UserPropertyTypeEnum.DATES_IN_WEEK:
//         return UserPropertyType.DATES_IN_WEEK;
//     }
//     print("Unknown type: $type");
//     throw UnimplementedError();
//   }
// }

// extension ServiceUserPropertyExtension on UserProperty {
//   static UserProperty fromAPIProperty(api.UserProperty userProperty) =>
//       userProperty.fromServiceProperty();

//   api.UserProperty toAPIProperty() {
//     return ApiUserPropertyExtension.toServiceProperty(this);
//   }
// }
