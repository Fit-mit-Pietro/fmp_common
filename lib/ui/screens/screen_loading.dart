

import 'package:flutter/material.dart';

class ScreenLoading extends StatelessWidget {
  const ScreenLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Loading ... "),
      ),
    );
  }
}
