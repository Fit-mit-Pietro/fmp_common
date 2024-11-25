import 'package:flutter/material.dart';
import 'package:fmp_common/ui/widgets/filter/filter_widget_expandable_container.dart';

class FieldWidgetValueBool extends StatelessWidget {
  final Function(bool) onValueChanged;
  final bool value;

  const FieldWidgetValueBool({
    Key? key,
    required this.onValueChanged,
    required this.value,
  }) : super(key: key);

  void _onValueChanged(bool? value) {
    if (value != null) onValueChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return FilterWidgetExpandableContainer(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<bool>(
            style:
                Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
            value: value,
            icon: const Icon(Icons.keyboard_arrow_down),
            elevation: 16,
            onChanged: _onValueChanged,
            items: const [
              DropdownMenuItem<bool>(
                value: true,
                child: Text("Ja"),
              ),
              DropdownMenuItem<bool>(
                value: false,
                child: Text("Nein"),
              ),
            ]),
      ),
    );
  }
}
