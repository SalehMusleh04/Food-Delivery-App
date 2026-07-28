class OnboardingModel {
  final String imgPath;
  final String title;
  final String description;
  OnboardingModel({
    required this.imgPath,
    required this.title,
    required this.description,
  });
}

List<OnboardingModel> pagesData = [
  OnboardingModel(
    imgPath: 'assets/imgs/foods.svg',
    title: 'Order Your Favorite Food',
    description:
        'Browse a wide menu from your favorite restaurants. Order what you crave with a single tap and enjoy a delicious meal anytime.',
  ),
  OnboardingModel(
    imgPath: 'assets/imgs/motor.svg',
    title: 'Fast Delivery to Your Door',
    description:
        'Our riders are ready to deliver your food hot and fresh in no time. Track your order live on the map until it reaches you.',
  ),
];
