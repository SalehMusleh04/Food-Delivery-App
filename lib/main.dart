import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/screens/bottom_nav_bar.dart';
import 'package:food_delivery_app/screens/details_page.dart';
import 'package:food_delivery_app/screens/home_page.dart';
import 'package:food_delivery_app/screens/onboarding.dart';
import 'package:food_delivery_app/screens/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]); // landscape ايقاف وضع ال
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodGo',
      routes: {
        '/': (context) => const Splash(),
        Onboarding.routeName: (context) => const Onboarding(),
        BottomNavBar.routeName: (context) => const BottomNavBar(),
        HomePage.routeName: (context) => const HomePage(),
        DetailsPage.routeName : (context) => const DetailsPage(),
      },
      theme: ThemeData(fontFamily: 'Sen'),
    );
  }
}
