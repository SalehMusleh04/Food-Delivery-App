import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/fav_page.dart';
import 'package:food_delivery_app/screens/home_page.dart';
import 'package:food_delivery_app/utils/app_colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  static const String routeName = '/bottomNavBar';
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List<Widget> bodyPages = const [HomePage(), Text('data'), Text('data'), FavPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyPages[currentIndex],
      floatingActionButton: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 1),
              blurRadius: 5,
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primaryColor,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.amber,
        ),
        child: AnimatedBottomNavigationBar(
          icons: const [
            Icons.home_filled,
            Icons.person_outline,
            Icons.chat_bubble_outline,
            Icons.favorite,
          ],
          activeIndex: currentIndex,
          onTap: (newIndex) => setState(() {
            currentIndex = newIndex;
          }),
          activeColor: Colors.white,
          inactiveColor: Colors.white60,
          backgroundColor: AppColors.primaryColor,
          gapLocation: GapLocation.center,
          notchMargin: 15,
        ),
      ),
    );
  }
}
