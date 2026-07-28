import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/onboarding_model.dart';
import 'package:food_delivery_app/screens/bottom_nav_bar.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/widgets/custom_indicator.dart';
import 'package:food_delivery_app/widgets/onboarding_pageview.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  static const String routeName = '/onboarding';
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int pageIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void goToMainPage() {
    Navigator.pushReplacementNamed(context, BottomNavBar.routeName);
  }

  void onPageChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: onPageChanged,
                itemBuilder: (context, index) =>
                    OnboardingPageview(pageView: pagesData[index], size: size),
                itemCount: pagesData.length,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pagesData.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: CustomIndicator(
                    isActive: pageIndex == index,
                    size: size,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: goToMainPage,
                    child: Text(
                      pageIndex == pagesData.length - 1 ? '' : 'Skip',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (pageIndex < pagesData.length - 1) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.ease,
                        );
                      } else {
                        goToMainPage();
                      }
                    },
                    splashColor: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.primaryColor,
                      ),
                      child: Text(
                        pageIndex == pagesData.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
