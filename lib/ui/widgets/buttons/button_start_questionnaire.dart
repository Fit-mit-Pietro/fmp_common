import 'package:flutter/material.dart';

class ButtonStartQuestionnaire extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final IconData icon;

  const ButtonStartQuestionnaire(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF03E68B))
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 20),
            ),
            SizedBox(
              width: 12,
              height: 48,
            ),
            Icon(
              icon,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
