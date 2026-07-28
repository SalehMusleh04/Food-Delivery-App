import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final Color bgColor;
  final IconData icon;
  final VoidCallback onPressed;
  final Size size;
  final double bottomPadding;
  const CounterButton({
    super.key,
    required this.bgColor,
    required this.icon,
    required this.onPressed,
    required this.size,
    this.bottomPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.1,
      height: size.height * 0.048,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          backgroundColor: bgColor,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        onPressed: onPressed,
        child: Padding(padding: EdgeInsets.only(bottom:bottomPadding), child: Icon(icon)),
      ),
    );
  }
}
