import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/models/onboarding_model.dart';
import 'package:food_delivery_app/utils/app_colors.dart';

class OnboardingPageview extends StatelessWidget {
  final OnboardingModel pageView;
  final Size size;
  const OnboardingPageview({
    super.key,
    required this.pageView,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          pageView.imgPath,
          fit: BoxFit.contain,
          width:  size.width * 0.85 ,
        ),
        Text(
          pageView.title,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(height:  size.height * 0.03 ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Text(
            pageView.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.fourthColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
