import 'package:fake_funny/common/storage_manager.dart';
import 'package:fake_funny/common/styles.dart';
import 'package:fake_funny/components/custom_icon.dart';
import 'package:fake_funny/database/database_manager.dart';
import 'package:fake_funny/model/user.dart';
import 'package:fake_funny/pages/profile/my_album_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with GetTickerProviderStateMixin{
  late TabController tabController;
  final tabBody = <Widget>[];
  final tabs = <Tab>[];
  List<MUser?> userList = <MUser>[];
  MUser user = MUser();
  var accountName = ''.obs;
  int? currentUser;
  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    initTab();
    initData(isAdd: false);
    super.onInit();
  }
  initData({required bool isAdd}) async {
    currentUser = await StorageManager.readData('USER');
    update();
    userList = await DataBaseManager().getUser();
      if(userList.isNotEmpty) {
        if(!isAdd) {
          if (currentUser != null) {
            user = userList[currentUser!]!;
            accountName.value = user.name!;
          }
        } else {
          user = userList[userList.length - 1]!;
          accountName.value = user.name!;
          StorageManager.saveData('USER', userList.length - 1);
        }
    }
    update();
  }
  initTab(){
    tabs.add(customTab(Icons.image,Get.width / 2));
    tabs.add(customTab(Icons.watch_later_sharp,Get.width / 2));
    tabBody.add(const MyAlBumPage());
    tabBody.add(const MyAlBumPage());
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