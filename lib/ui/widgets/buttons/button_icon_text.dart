import 'package:flutter/material.dart';

class ButtonIconText extends StatelessWidget {
  const ButtonIconText({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
          ),
          const SizedBox(
            width: 12,
          ),
          Icon(
            icon,
          )
        ],
      ),
    );
  }
}
