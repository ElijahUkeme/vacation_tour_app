import 'package:flutter/cupertino.dart';

class CirclePainter extends BoxPainter{

  final Color color;
  double radius;
  CirclePainter({required this.color,required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2,configuration.size!.height - radius);

    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }

}