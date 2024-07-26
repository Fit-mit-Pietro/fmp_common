import 'package:flutter/material.dart';
import 'package:fmp_common/platform/backend_service/filter/filter_lib.dart';

import 'package:fmp_common/ui/widgets/filter/field_value_widget_bool.dart';
import 'package:fmp_common/ui/widgets/filter/field_value_widget_enum.dart';
import 'package:fmp_common/ui/widgets/filter/field_value_widget_int.dart';
import 'package:fmp_common/ui/widgets/filter/field_value_widget_text.dart';

class FieldValueWidget extends StatelessWidget {
  Function(dynamic) onValueChanged;
  Field field;
  dynamic value;

  FieldValueWidget(
      {Key? key,
      required this.onValueChanged,
      required this.field,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (field.type) {
      case FieldValueType.bool:
        bool _value = false;
        try {
          _value = value as bool;
        } catch (e) {
          print(e);
        }

        return FieldWidgetValueBool(
          onValueChanged: onValueChanged,
          value: _value,
        );
      case FieldValueType.int:
        int _value = 0;
        try {
          _value = value as int;
        } catch (e) {
          print(e);
        }

        return FieldWidgetValueInt(
          onValueChanged: onValueChanged,
          value: _value,
        );
      case FieldValueType.text:
        String _value = "";
        try {
          _value = value as String;
        } catch (e) {
          print(e);
        }

        return FieldWidgetValueText(
          onValueChanged: onValueChanged,
          value: _value,
        );
      case FieldValueType.bodyMap:
        return const Text("Bodymap not supported!");
      case FieldValueType.$enum:
        String _value = "";
        try {
          _value = value as String;
        } catch (e) {
          print(e);
        }
        return FieldValueWidgetEnum(
          onValueChanged: onValueChanged,
          value: _value,
          enumOptions: field.enumValues!,
        );
      case FieldValueType.datesInWeek:
        return const Text("Nicht unterstützt!");
    }
  }
}
