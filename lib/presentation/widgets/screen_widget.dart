import 'package:flutter/material.dart';
import 'package:moviebooker/core/colors.dart';

class CurvedScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.lightBlue // Light blue color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 0.5); // Adds shadow effect

    Path path = Path();
    path.moveTo(0, size.height * 0.9);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.1, size.width, size.height * 0.9);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CurvedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvedScreenPainter(),
      size: Size(220, 10), // Adjust height for visibility
    );
  }
}
