import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/widgets/counter_button.dart';

class PoritionCounter extends StatefulWidget {
  final Size size;
  const PoritionCounter({super.key, required this.size});
  @override
  State<PoritionCounter> createState() => _PoritionCounterState();
}

class _PoritionCounterState extends State<PoritionCounter> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Portion'),
        Row(
          children: [
            CounterButton(
              size: widget.size,
              bottomPadding: 10,
              bgColor: counter > 1 ? AppColors.primaryColor : Colors.grey,
              icon: Icons.minimize,
              onPressed: () {
                if (counter > 1) {
                  setState(() {
                    counter--;
                  });
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(counter.toString()),
            ),
            CounterButton(
              size: widget.size,
              bgColor: AppColors.primaryColor,
              icon: Icons.add,
              onPressed: () => setState(() {
                counter++;
              }),
            ),
          ],
        ),
      ],
    );
  }
}
