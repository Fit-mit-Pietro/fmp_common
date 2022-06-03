
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp_common/fmp_common.dart';
import 'package:svg_path_parser/svg_path_parser.dart';
import 'package:touchable/touchable.dart';

class BodyCanvas extends StatelessWidget {

  final BodySelectorViewModel model;
  final bool front;

  const BodyCanvas({Key? key,required this.model,required this.front}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: [
        Container(
          child: AspectRatio(
            aspectRatio:  336 /  460,
            child: Image.asset(front?
              "assets/img/body_map/body_front_bg.png":
              "assets/img/body_map/body_back_bg.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 336 /  460,
          child: Container(
            child: CanvasTouchDetector(
              gesturesToOverride: [GestureType.onTapDown,GestureType.onTapUp],
              builder: (context) => CustomPaint(
                painter: BodyPainter(
                  context: context,
                  model: model,
                  front:front
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class BodyPainter extends CustomPainter {

  final BuildContext context;
  final BodySelectorViewModel model;
  final bool front;

  BodyPainter({
    required this.context,
    required this.model,
    required this.front,
  });

  @override
  void paint(Canvas canvas, Size size) {

    var myCanvas = TouchyCanvas(context, canvas);

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;

    // Scale each path to match canvas size
    var xScale = size.width / 336.32001;
    var yScale = size.height / 460.48001;
    final Matrix4 matrix4 = Matrix4.identity();

    matrix4.scale(xScale, yScale);

    List<BodyPart> generalParts = front ? model.front : model.back;

    generalParts.forEach((part) {

      Path path = parseSvgPath(part.path);
      if (model.isPartSelected(part)) {
        paint.color = Color(0xFF03E68B).withAlpha(50);
      }else{
        paint.color = Colors.white.withAlpha(50);
      }

      paint.style = PaintingStyle.fill;

      myCanvas.drawPath(
        path.transform(matrix4.storage),
        paint,
      );

      paint.style = PaintingStyle.stroke;
      if (model.isPartSelected(part)) {
        paint.color = Color(0xFF03E68B);
      }else{
        paint.color = Colors.white.withAlpha(180);
      }

      myCanvas.drawPath(
        path.transform(matrix4.storage),
        paint,
        onTapDown: (details) {
          if(model.onPartTapped != null){
            model.onPartTapped!(part,details);
          }
        },
      );
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
