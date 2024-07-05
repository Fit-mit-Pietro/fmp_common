

import 'package:flutter/material.dart';

class TextViewKeyValue extends StatelessWidget {

  final String textKey;
  final String value;

  const TextViewKeyValue({Key? key,required this.textKey,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textKey,style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),),
        Container(height: 1,color: Theme.of(context).dividerColor,margin: const EdgeInsets.symmetric(vertical: 4),),
        Text(value,style: Theme.of(context).textTheme.bodyLarge,),
      ],
    );
  }
}
