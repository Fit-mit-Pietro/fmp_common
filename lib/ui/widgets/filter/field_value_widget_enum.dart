import 'package:flutter/material.dart';
import 'package:fmp_common/ui/widgets/filter/filter_widget.dart';
import 'package:fmp_common/ui/widgets/filter/filter_widget_expandable_container.dart';

class FieldValueWidgetEnum extends StatelessWidget {
  Function(String) onValueChanged;
  String value;
  Map<String, String> enumOptions;

  FieldValueWidgetEnum(
      {Key? key,
      required this.onValueChanged,
      required this.value,
      required this.enumOptions})
      : super(key: key){
    if(enumOptions.containsKey(value) == false){
      value = enumOptions.keys.first;
    }
  }

  void _onValueChanged(String? value) {
    if (value != null) onValueChanged(value);
  }


  @override
  Widget build(BuildContext context) {
    return FilterWidgetExpandableContainer(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16),
            value: value,
            icon: const Icon(Icons.keyboard_arrow_down),
            elevation: 16,
            onChanged: _onValueChanged,
            items:  enumOptions.keys.map<
                DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: DropDownChild(
                      text: enumOptions[value]!,
                  )
              );
            }).toList(),
        )

      ),
    );
  }
}
