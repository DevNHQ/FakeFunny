import 'package:fake_funny/common/styles.dart';
import 'package:fake_funny/components/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomAppBar extends AppBar {
  CustomAppBar({Key? key,
    BuildContext? context,
    String? title,
    Widget? widgetTitle,
    VoidCallback? onLeadingAction,
    List<Widget>? actions ,
    double? elevation,
    PreferredSizeWidget? bottom,
    bool showBackIcon = true,
    bool automaticallyImplyLeading = true,
    bool centerTitle = true,
    Color? appBarColor,
    dynamic leadingIcon,
  }) : super(key: key,
    title: Text(title ?? '', style: appbarStyle),
    automaticallyImplyLeading: automaticallyImplyLeading,
    backgroundColor:  appBarColor ?? appbarColor,
    leading: showBackIcon ?  CustomIcon(
      icon: leadingIcon ?? Icons.arrow_back_rounded,
      iconColor: defaultColor,
      onPressed: onLeadingAction ?? () => Get.back(),
    ): null,
    centerTitle: centerTitle,
    actions: actions,
    elevation: elevation,
    bottom: bottom,
  );
}