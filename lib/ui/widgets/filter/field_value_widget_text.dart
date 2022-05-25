import 'package:flutter/material.dart';
import 'package:fmp_common/ui/widgets/filter/filter_widget_expandable_container.dart';

class FieldWidgetValueText extends StatefulWidget {
  Function(String) onValueChanged;
  String value;

  FieldWidgetValueText(
      {Key? key, required this.onValueChanged, required this.value})
      : super(key: key);

  @override
  _FieldWidgetValueTextState createState() => _FieldWidgetValueTextState();
}

class _FieldWidgetValueTextState extends State<FieldWidgetValueText> {
  TextEditingController _editingController = TextEditingController();

  void _onValueChanged(String? value) {
    if (value != null) widget.onValueChanged(value);
  }

  @override
  void initState() {
    super.initState();
    _editingController.text = (widget.value ?? "").toString();
    _editingController.addListener(() {
      _onValueChanged(_editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.08), width: 1),
            borderRadius: BorderRadius.circular(4)),
        enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.black.withOpacity(0.08), width: 1),
            borderRadius: BorderRadius.circular(4)),
        disabledBorder: OutlineInputBorder(
            borderSide:   BorderSide(color: Colors.black.withOpacity(0.08), width: 1),
            borderRadius: BorderRadius.circular(4)),
        focusedBorder:  OutlineInputBorder(
            borderSide:   BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
            borderRadius: BorderRadius.circular(4)),
      ),
      controller: _editingController,
    );
  }
}
