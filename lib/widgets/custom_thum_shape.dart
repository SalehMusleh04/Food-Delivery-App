import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';

class CustomThumShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(20, 20);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint fillPaint = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final Rect squareRect = Rect.fromCenter(
      center: center,
      width: 10,
      height: 20,
    );

    final RRect roundedRect = RRect.fromRectAndRadius(
      squareRect,
      const Radius.circular(8),
    );

    canvas.drawRRect(roundedRect, fillPaint);
    canvas.drawRRect(roundedRect, borderPaint);
  }
}
