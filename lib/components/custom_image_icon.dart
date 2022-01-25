import 'package:fake_funny/common/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomImageIcon extends StatelessWidget {
  VoidCallback? onPressed;
  Color? backgroundColor;
  Color? iconColor;
  dynamic  icon;
  AlignmentGeometry? alignment;
  CustomImageIcon({Key ? key,this.alignment, this.icon, this.onPressed,this.backgroundColor,this.iconColor}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          side: const BorderSide(width: 0, color: Colors.transparent),
          backgroundColor: backgroundColor ?? backgroundColor,
          padding: EdgeInsets.zero,
          alignment: alignment,

        ),
        onPressed: onPressed ?? onPressed,
        child: Image.asset(
            icon,
            color: iconColor ?? defaultColor,
            width: 24.0,
            height: 24.0,
        ),
      ),
    );
  }
}