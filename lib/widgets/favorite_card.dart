import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_item_model.dart';
import 'package:food_delivery_app/screens/details_page.dart';
import 'package:food_delivery_app/widgets/fav_button.dart';

class FavoriteCard extends StatelessWidget {
  final FoodItemModel favoriteFood;
  final bool isFavorite;
  final VoidCallback onPressed;
  final int index;
  const FavoriteCard({
    super.key,
    required this.favoriteFood,
    required this.onPressed,
    required this.isFavorite,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsPage(index: index)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Card(
          color: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  favoriteFood.imgPath,
                  height: constraints.maxWidth * 0.2,
                  width: constraints.maxWidth * 0.2,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: constraints.maxWidth * 0.015),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(favoriteFood.name),
                    Text(favoriteFood.subTitle),
                  ],
                ),
                const Spacer(),
                FavButton(isFavorite: isFavorite, onPressed: onPressed),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
