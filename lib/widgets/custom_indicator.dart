import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  final bool isActive;
  final Size size;
  const CustomIndicator({
    super.key,
    required this.isActive,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isActive ? AppColors.primaryColor : AppColors.fourthColor,
      ),
      width: isActive ? 0.08 * size.width : 0.025 * size.width,
      height: 0.011 * size.height,
    );
  }
}
