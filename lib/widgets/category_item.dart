import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final VoidCallback onTap;
  final String categoryItem;
  final bool isActive;
  const CategoryItem({
    super.key,
    required this.onTap,
    required this.isActive,
    required this.categoryItem,
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Text(
            categoryItem,
            style: TextStyle(
              color: isActive ? Colors.white : AppColors.fourthColor,
            ),
          ),
        ),
      ),
    );
  }
}
