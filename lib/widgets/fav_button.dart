import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';

class FavButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onPressed;
  final double? size;
  const FavButton({
    super.key,
    required this.isFavorite,
    required this.onPressed,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: AppColors.primaryColor,
        size: size,
      ),
      onPressed: onPressed,
    );
  }
}
