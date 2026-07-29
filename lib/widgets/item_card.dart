import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/models/food_item_model.dart';
import 'package:food_delivery_app/screens/details_page.dart';
import 'package:food_delivery_app/ui_models/food_details_args.dart';
import 'package:food_delivery_app/widgets/fav_button.dart';

class ItemCard extends StatelessWidget {
  final FoodItemModel filteredItem;
  final bool isFavorite;
  final VoidCallback onPressed;
  final void Function(Object? value) rebuildScreen;
  const ItemCard({
    super.key,
    required this.filteredItem,
    required this.isFavorite,
    required this.onPressed,
    required this.rebuildScreen,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        int originalIndex = foods.indexWhere(
          (foodItem) => foodItem.id == filteredItem.id,
        );
        Navigator.pushNamed(
          context,
          DetailsPage.routeName,
          arguments: FoodDetailsArgs(foodIndex: originalIndex),
        ).then((value) => rebuildScreen(value));
      },
      child: Padding(
        padding: const EdgeInsetsGeometry.only(bottom: 20),
        child: LayoutBuilder(
          builder: (context, constraints) => Card(
            color: Colors.white,
            elevation: 8,
            shadowColor: Colors.black.withOpacity(0.8),
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      filteredItem.imgPath,
                      height: 0.53 * constraints.maxHeight,
                      fit: BoxFit.contain,
                    ),
                  ),
                  FittedBox(
                    child: Text.rich(
                      TextSpan(
                        text: '${filteredItem.name}\n',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: filteredItem.subTitle,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 0.035 * constraints.maxHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/star.svg'),
                      SizedBox(width: 0.02 * constraints.maxWidth),
                      Text(filteredItem.rating),
                      const Spacer(),
                      FavButton(isFavorite: isFavorite, onPressed: onPressed),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
