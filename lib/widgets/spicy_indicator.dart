import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/widgets/custom_thum_shape.dart';

class SpicyIndicator extends StatefulWidget {
  final Size size;
  const SpicyIndicator({super.key, required this.size});

  @override
  State<SpicyIndicator> createState() => _SpicyIndicatorState();
}

class _SpicyIndicatorState extends State<SpicyIndicator> {
  double spicyLevel = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Spicy'),
        SizedBox(height: widget.size.height * 0.01),
        SizedBox(
          width: widget.size.width * 0.43,
          child: SliderTheme(
            data: SliderThemeData(thumbShape: CustomThumShape()),
            child: Slider(
              padding: const EdgeInsets.all(0),
              activeColor: AppColors.primaryColor,
              min: 1,
              max: 10,
              value: spicyLevel,
              inactiveColor: AppColors.fourthColor.withOpacity(0.2),
              onChanged: (value) => {
                setState(() {
                  spicyLevel = value;
                }),
              },
            ),
          ),
        ),
        SizedBox(
          width: widget.size.width * 0.44,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Mild', style: TextStyle(color: AppColors.thirdColor)),
                Text('Hot', style: TextStyle(color: AppColors.primaryColor)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
