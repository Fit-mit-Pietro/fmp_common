import 'package:flutter/material.dart';
import 'package:fmp_common/platform/validator/string_validator.dart';

class FieldWidgetValueInt extends StatefulWidget {
  Function(int) onValueChanged;
  int value;

  FieldWidgetValueInt(
      {Key? key, required this.onValueChanged, required this.value})
      : super(key: key);

  @override
  _FieldWidgetValueIntState createState() => _FieldWidgetValueIntState();
}

class _FieldWidgetValueIntState extends State<FieldWidgetValueInt> {
  final TextEditingController _editingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _onValueChanged() {
    if (_formKey.currentState!.validate()) {
      String value = _editingController.text;
      int? i = int.tryParse(value);
      if( i != null){
        widget.onValueChanged(i);
      }
        }
  }

  @override
  void initState() {
    super.initState();
    _editingController.text = (widget.value ?? "").toString();

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _onValueChanged,
      key: _formKey,
      child: TextFormField(
        keyboardType: TextInputType.number,
        maxLines: 1,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
        validator: StringValidator.validateIntParsableNotNull,
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
      ),
    );
  }
}
