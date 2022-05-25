
import 'package:flutter/material.dart';


// enables to listen for user interaction on the underlying widget while also
// providing nice animations for onTap and onLongTap Tappable
class Tappable extends StatelessWidget{

  final GestureTapCallback? onTap;
  final GestureTapCallback? onLongTap;
  final ValueChanged<bool>? onHover;
  final Widget child;
  final double radius;
  final StackFit fit;

  final Color overlayColor;
  final Color? hoverColor;

  const Tappable({
    this.overlayColor = Colors.transparent,
    this.hoverColor,
    required this.child,
    this.radius = 4,
    this.fit = StackFit.loose,
    key,
    this.onTap,
    this.onLongTap,
    this.onHover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(onTap == null && onLongTap == null && onHover == null){
      return child;
    }
    return Stack(
      fit: fit,
      children: [
        child,
        Positioned.fill(
          child: Material(
            color: overlayColor,
            child: InkWell(
              focusColor: Colors.transparent,
              borderRadius: BorderRadius.circular(radius),
              onTap: onTap,
              onLongPress: onLongTap,
              onHover: onHover,
              hoverColor: hoverColor,
            )
          )
        )
      ]
    );
  }
}
