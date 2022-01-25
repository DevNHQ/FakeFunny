import 'package:flutter/material.dart';
class CustomTabBar extends Container implements PreferredSizeWidget {
  CustomTabBar({Key? key, this.color, required this.tabBar}) : super(key: key);

  final Color? color;
  late TabBar tabBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color,
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFEBEBEB),
            blurRadius: 1,
            spreadRadius: 0.5,
            offset: Offset(0, 0), // shadow direction: bottom right
          )
        ],
      ),
      child: tabBar,
    );
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => tabBar.preferredSize;
}