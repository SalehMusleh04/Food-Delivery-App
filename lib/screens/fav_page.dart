import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_item_model.dart';
import 'package:food_delivery_app/widgets/favorite_card.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});
  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    List favoriteFood = foods.where((foodItem) => foodItem.isFavorite).toList();
    if (favoriteFood.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imgs/empty_page.png',
              height: size.height * 0.5,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'You haven\'t added any favorite meals \nStart exploring our delicious dishes!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors
                      .black54, // اللون الرمادي يعطي إيحاء بأن الصفحة فارغة
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: favoriteFood.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: FavoriteCard(
                index: index,
                favoriteFood: favoriteFood[index],
                onPressed: () {
                  int originalIndex = foods.indexWhere(
                    (foodItem) => foodItem.id == favoriteFood[index].id,
                  );
                  setState(() {
                    foods[originalIndex] = foods[originalIndex].copyWith(
                      isFavorite: false,
                    );
                  });
                },
                isFavorite: favoriteFood[index].isFavorite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
