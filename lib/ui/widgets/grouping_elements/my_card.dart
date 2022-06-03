import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final double maxHeight;

  const MyCard({Key? key, required this.child, this.maxHeight= double.infinity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 8, offset: Offset(2, 0)),

          ]),
      child: child
    );
  }
}
