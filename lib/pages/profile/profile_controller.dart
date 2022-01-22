import 'package:fake_funny/pages/profile/my_album_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with GetTickerProviderStateMixin{
  late TabController tabController;
  final tabBody = <Widget>[];
  final tabs = <Tab>[];
  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    initTab();
    super.onInit();
  }
  initTab(){
    tabs.add(customTab(Icons.image,Get.width / 2));
    tabs.add(customTab(Icons.watch_later_sharp,Get.width / 2));
    tabBody.add(MyAlBumPage());
    tabBody.add(MyAlBumPage());
  }
}
dynamic customTab(icon,width) {
  return Tab(
      child: Container(
        width: width,
        alignment: Alignment.center,
        child: Icon(icon),
      )
  );
}