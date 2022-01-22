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
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.0),
            blurRadius: 0.5,
            spreadRadius: 0.0,
            offset: const Offset(1, -1), // shadow direction: bottom right
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