import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/screens/onboarding.dart';
import 'package:food_delivery_app/utils/app_colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, Onboarding.routeName);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradientColor,
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const Spacer(),
              FadeTransition(
                opacity: fadeAnimation,
                child: SvgPicture.asset('assets/imgs/Foodgo.svg'),
              ),
              const Spacer(),
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Positioned(
                      left: -10,
                      child: Image.asset(
                        'assets/imgs/burger2.png',
                        height:  0.27 * size.height ,
                      ),
                    ),
                    Positioned(
                      left: 100,
                      child: Image.asset(
                        'assets/imgs/burger1.png',
                        height:  0.23 * size.height,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
