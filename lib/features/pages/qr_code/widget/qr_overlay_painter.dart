import 'package:flutter/material.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';

class QrOverlayPainter extends CustomPainter {
  final Size? size;

  QrOverlayPainter({this.size});

  @override
  void paint(Canvas canvas, Size canvasSize) {
    if (size == Size.zero) return;

    final paint = Paint()
      ..color = AppColors.c70B458
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final rect = Rect.fromLTWH(
      (canvasSize.width - size!.width) / 2,
      (canvasSize.height - size!.height) / 2,
      size!.width,
      size!.height,
    );

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(QrOverlayPainter oldDelegate) {
    return oldDelegate.size != size;
  }
}
