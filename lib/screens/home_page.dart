import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/category_item_model.dart';
import 'package:food_delivery_app/models/food_item_model.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/widgets/category_item.dart';
import 'package:food_delivery_app/widgets/custom_search_bar.dart';
import 'package:food_delivery_app/widgets/item_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int selectedCategoryIndex;
  late List filteredFood;
  @override
  void initState() {
    super.initState();
    selectedCategoryIndex = 0;
    filteredFood = foods;
  }

  void onChangeSearch(String value) {
    setState(() {
      filteredFood = foods.where((item) {
        return (item.name.toLowerCase().contains(value.toLowerCase()) ||
                item.subTitle.toLowerCase().contains(value.toLowerCase())) &&
            (selectedCategoryIndex != 0
                ? item.categoryId == categories[selectedCategoryIndex].id
                : true);
      }).toList();
    });
  }

  void filterByCategory() {
    setState(() {
      if (selectedCategoryIndex == 0) {
        filteredFood = foods;
      } else {
        filteredFood = foods
            .where(
              (foodItem) =>
                  foodItem.categoryId == categories[selectedCategoryIndex].id,
            )
            .toList();
      }
    });
  }

  void isFavoriteChange(int index) {
    final int originalIndex = foods.indexWhere(
      (foodItem) => foodItem.id == filteredFood[index].id,
    );
    setState(() {
      foods[originalIndex] = foods[originalIndex].copyWith(
        isFavorite: !foods[originalIndex].isFavorite,
      );
      filteredFood[index] = foods[originalIndex];
    });
  }

  Widget headPage({required double height, required double width}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            text: 'Foodgo\n',
            style: Theme.of(
              context,
            ).textTheme.displaySmall!.copyWith(fontFamily: 'Lobster'),
            children: [
              TextSpan(
                text: 'Order your favourite food!',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(fontFamily: 'Poppins'),
              ),
            ],
          ),
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage('assets/imgs/profile_pic.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              headPage(height: size.height * 0.07, width: size.width * 0.14),
              SizedBox(height: 0.04 * size.height),
              Row(
                children: [
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0, 4),
                            spreadRadius: 1,
                            blurRadius: 7,
                          ),
                        ],
                      ),
                      child: CustomSearchBar(onChanged: onChangeSearch),
                    ),
                  ),
                  SizedBox(width: 0.05 * size.width),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.primaryColor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(Icons.tune, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.04 * size.height),
              SizedBox(
                height: 0.0515 * size.height,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      SizedBox(width: 0.05 * size.width),
                  itemBuilder: (context, index) => CategoryItem(
                    categoryItem: categories[index].categoryItem,
                    isActive: selectedCategoryIndex == index,
                    onTap: () {
                      selectedCategoryIndex = index;
                      filterByCategory();
                    },
                  ),
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 0.04 * size.height),
              Expanded(
                child: GridView.builder(
                  itemCount: filteredFood.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: size.height * 0.015,
                    crossAxisSpacing: size.width * 0.009,
                    mainAxisExtent: size.height * 0.34,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                    rebuildScreen: (value) {
                      if (value == true) {
                        filterByCategory();
                      }
                    },
                    filteredItem: filteredFood[index],
                    isFavorite: filteredFood[index].isFavorite,
                    onPressed: () => isFavoriteChange(index),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
