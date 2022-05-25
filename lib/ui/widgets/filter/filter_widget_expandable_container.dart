

import 'package:flutter/material.dart';

class FilterWidgetExpandableContainer extends StatelessWidget {

  Widget child;

  FilterWidgetExpandableContainer({
    required this.child,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.08), width: 1),
          borderRadius: BorderRadius.circular(4)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: child,
    );
  }
}

