import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:flutter/material.dart';

class AppThemeButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  final void Function() onTap;

  AppThemeButton({
    this.width = double.infinity,
    this.height = 55,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              backgroundColor ?? AppColors.themeColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        child: Text(
          text,
          style: Styles.body1TextStyle().copyWith(
            color: textColor??AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
