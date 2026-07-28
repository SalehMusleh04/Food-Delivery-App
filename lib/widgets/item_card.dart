import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/models/food_item_model.dart';
import 'package:food_delivery_app/screens/details_page.dart';
import 'package:food_delivery_app/widgets/fav_button.dart';

class ItemCard extends StatelessWidget {
  final FoodItemModel foodItem;
  final bool isFavorite;
  final VoidCallback onPressed;
  final int index;
  const ItemCard({
    super.key,
    required this.foodItem,
    required this.isFavorite,
    required this.onPressed,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsPage(index: index)),
      ),
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
                      foodItem.imgPath,
                      height: 0.53 * constraints.maxHeight,
                      fit: BoxFit.contain,
                    ),
                  ),
                  FittedBox(
                    child: Text.rich(
                      TextSpan(
                        text: '${foodItem.name}\n',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: foodItem.subTitle,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(height:  0.035 * constraints.maxHeight,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/star.svg'),
                       SizedBox(width: 0.02 * constraints.maxWidth),
                      Text(foodItem.rating),
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
