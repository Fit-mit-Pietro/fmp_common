

import 'package:flutter/material.dart';

class AutoCompleteTextField extends StatefulWidget {

  Function(String text)? onChanged;

  AutoCompleteTextField({Key? key,this.onChanged}) : super(key: key);

  @override
  _AutoCompleteTextFieldState createState() => _AutoCompleteTextFieldState();
}

class _AutoCompleteTextFieldState extends State<AutoCompleteTextField> {

  final TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.onChanged != null){
      _editingController.addListener(() {
        widget.onChanged?.call((_editingController.text));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.search),
        hintText: "Suchen"
      ),

      controller: _editingController,
    );
  }
}
