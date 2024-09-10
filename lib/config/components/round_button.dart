import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture_masterclass/config/color/colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      required this.title,
      required this.onPress,
      this.height = 40});

  final String title;
  final VoidCallback onPress;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
