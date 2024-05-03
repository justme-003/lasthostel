import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonText,
    this.buttonTextColor,
    required this.press,
    this.size,
    required MaterialColor color,
  });
  final String? buttonText;
  final Color? buttonTextColor;
  final Function() press;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 10, 111, 218),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Center(
          child: Text(
            buttonText ?? " ",
            style: AppTextTheme.kLabelStyle.copyWith(
                color: buttonTextColor ?? AppColors.kLight,
                fontSize: size ?? 16),
          ),
        ),
      ),
    );
  }
}
