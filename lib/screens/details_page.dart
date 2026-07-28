import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/models/food_item_model.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/widgets/fav_button.dart';
import 'package:food_delivery_app/widgets/porition_counter.dart';
import 'package:food_delivery_app/widgets/spicy_indicator.dart';

class DetailsPage extends StatefulWidget {
  final int index;
  const DetailsPage({super.key, required this.index});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsetsGeometry.all(10),
              sliver: SliverAppBar(
                surfaceTintColor: Colors.transparent,
                pinned: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_circle_left_outlined,
                    size: size.width * 0.1,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    foods[widget.index].imgPath,
                    fit: BoxFit.contain,
                  ),
                ),
                expandedHeight: size.height * 0.24,
                actions: [
                  FavButton(
                    isFavorite: foods[widget.index].isFavorite,
                    onPressed: () => setState(() {
                      foods[widget.index] = foods[widget.index].copyWith(
                        isFavorite: !foods[widget.index].isFavorite,
                      );
                    }),
                    size: size.width * 0.09,
                  ),
                ],
              ),
            ),
        
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.035),
                    Text(
                      foods[widget.index].subTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset('assets/icons/star.svg'),
                        SizedBox(width: size.width * 0.013),
                        Text(
                          '${foods[widget.index].rating} - ${foods[widget.index].prepTime} mins',
                          style: const TextStyle(
                            color: AppColors.fourthColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(foods[widget.index].description),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      children: [
                        SpicyIndicator(size: size),
                        const Spacer(),
                        PoritionCounter(size: size),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 30.0,
          top: 10,
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '\$${foods[widget.index].price}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryColor,
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              child: const Text('ORDER NOW'),
            ),
          ],
        ),
      ),
    );
  }
}
