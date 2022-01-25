import 'package:fake_funny/common/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? titleColor;
  final double borderRadius;
  final double fontSize;
  final double? width;
  final double? height;
  const CustomButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.backgroundColor,
      this.borderRadius = 30.0,
      this.width,
      this.height,
      this.fontSize = 14.0, this.titleColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width - 32 ,
      height: height ?? 45.0,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          side: const BorderSide(width: 1, color: Colors.transparent),
          backgroundColor: backgroundColor ?? baseAppColor,
          padding: const EdgeInsets.only(top: 5),
          elevation: 3,
          animationDuration: const Duration(seconds: 1),
          shadowColor: Colors.lightBlue,
        ),
        onPressed: () => onPressed(),
        child: Text(title, style: buttonStyle),
      ),
    );
  }
}