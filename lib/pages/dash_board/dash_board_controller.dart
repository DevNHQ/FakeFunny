import 'package:fake_funny/common/constants.dart';
import 'package:fake_funny/common/storage_manager.dart';
import 'package:fake_funny/common/styles.dart';
import 'package:fake_funny/components/custom_icon.dart';
import 'package:fake_funny/components/custom_image.dart';
import 'package:fake_funny/components/custom_image_file.dart';
import 'package:fake_funny/components/custom_image_icon.dart';
import 'package:fake_funny/data/country.dart';
import 'package:fake_funny/language/const.dart';
import 'package:fake_funny/localization_service.dart';
import 'package:fake_funny/model/m_country.dart';
import 'package:fake_funny/model/m_left_menu.dart';
import 'package:fake_funny/model/user.dart';
import 'package:fake_funny/pages/home/home_page.dart';
import 'package:fake_funny/pages/profile/profile_controller.dart';
import 'package:fake_funny/pages/profile/profile_page.dart';
import 'package:fake_funny/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController with GetTickerProviderStateMixin{
  late ProfileController profileController = Get.put(ProfileController());
  var currentIndex = 0.obs;
  int bottomNvgLastIndex = 0;
  List<MCountry> languageList =   List<MCountry>.from(language.map((x) => MCountry.fromJson(x)));
  List<MLeftMenu> leftMenu =   List<MLeftMenu>.from(menu.map((x) => MLeftMenu.fromJson(x)));
  String? selectedLang;
  List<Widget>? dashBoardWidgets = <Widget>[
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const ProfilePage(),
  ];
  bool isCollapsed = true;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<double> menuScaleAnimation;
  late Animation<Offset> slideAnimation;
  @override
  Future<void> onInit() async{
    controller = AnimationController(vsync: this, duration: duration);
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(controller);
    menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(controller);
    slideAnimation = Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0)).animate(controller);
    initLanguage();
    super.onInit();
  }
  @override
  Future<void> onClose() async{
    controller.dispose();
    super.onClose();
  }
  List<Widget>? leadingWidget () {
    switch (currentIndex.value) {
      case 0:
        return  [
          CustomIcon(
            icon: Icons.add,
            alignment: Alignment.centerRight,
            onPressed: () => Get.toNamed(AppRoutes.postOptions),
          ),
          CustomIcon(icon: Icons.mark_email_unread_sharp),
        ];
      case 1:
      case 2:
      case 3:
        return  [
          CustomImageIcon(
            icon: 'assets/icons/live_event.png',
            alignment: Alignment.centerRight,
            onPressed: () => Get.toNamed(AppRoutes.postOptions),
          ),
          CustomImageIcon(icon: 'assets/icons/menu.png'),
        ];
      default:
        return [];
    }
  }
  String? leadingIcon () {
    switch (currentIndex.value) {
      case 0:
      case 1:
      case 2:
        return null;
      case 3:
        return  'assets/icons/add_user.png';
      default:
        return null;
    }
  }
  List<Widget>? actionWidget () {
    switch (currentIndex.value) {
      case 0:
        return  [
          CustomIcon(
            icon: Icons.add,
            alignment: Alignment.centerRight,
            onPressed: () => Get.toNamed(AppRoutes.postOptions),
          ),
          CustomIcon(icon: Icons.mark_email_unread_sharp),
        ];
      case 1:
      case 2:
      case 3:
        return  [
          CustomImageIcon(
            icon: 'assets/icons/live_event.png',
            alignment: Alignment.centerRight,
            onPressed: () => Get.toNamed(AppRoutes.postOptions),
          ),
          CustomImageIcon(icon: 'assets/icons/menu.png'),
        ];
      default:
        return [];
    }
  }
  void initLanguage() async{
    String? lg =  await StorageManager.readData(Constants.language);
      if(lg != null) {
        selectedLang = lg;
        LocalizationService.changeLocale(lg);
      } else {
        selectedLang = 'vi';
        LocalizationService.changeLocale('vi');
      }
    update();
  }
  void changeIndex(value){
    currentIndex.value = value;
    update();
  }
  void actionMenu({index, screen}) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        Get.toNamed(screen);
        break;
      case 5:
        break;
    }
    controller.reverse();
    isCollapsed = !isCollapsed;
    update();
  }
  void updateLang({value}) {
    selectedLang = value;
    LocalizationService.changeLocale(value);
    StorageManager.saveData(Constants.language, value);
    update();
  }
  void switchAction() {
    if(isCollapsed) {
      controller.forward();
    } else {
      controller.reverse();
    }
    isCollapsed = !isCollapsed;
    update();
  }
  appbarTitle () {
    switch (currentIndex.value) {
      case 0:
      case 1:
      case 2:
        return home.tr;
      case 3:
      default:
        return '';
    }
  }
  Widget? profileTitle() {
    if(currentIndex.value == 3) {
      return  InkWell(
        onTap: () => Get.bottomSheet(
            Container(
              height: profileController.userList.isNotEmpty ? (profileController.userList.length * 75.0) + 50.0 + 16.0 + 75.0 : 75.0 + 50.0 + 16.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50.0,
                    child: Row (
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIcon(icon: Icons.clear_outlined,iconColor: Colors.transparent),
                        Text(switchAcc.tr, style: size16W700Default),
                        CustomIcon(
                            icon: Icons.clear_outlined,
                            iconColor: defaultColor,
                            onPressed: () => Get.back()
                        ),
                      ],
                    ),
                  ),
                  if (profileController.userList.isNotEmpty) Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      itemCount: profileController.userList.length,
                      itemExtent: 75.0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => {
                            Get.back(),
                            StorageManager.saveData('USER', index),
                            Future.delayed(const Duration(milliseconds: 250), () => profileController.initData(isAdd: false)),
                          },
                            child: item(user: profileController.userList[index]!, index: index),
                        );
                      },
                    ),
                  ) else const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                    child: addUser(),
                  ),
                ],
              ),
            ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                profileController.accountName.value.isNotEmpty ? profileController.accountName.value :  name.tr.toLowerCase(),
                style: size16W700Default
              ),
            ),
            const SizedBox(width: 7.0),
            Image.asset(
                'assets/icons/arrow_down.png',
                width: 12,
                height: 12,
                fit: BoxFit.contain,
            ),
          ],
        ),
      );
    } else {
      return null;
    }
  }
  Widget customIcon({index, icon,showBadge,title}) {
    return SizedBox(
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // showBadge ? Container(
          //   width: 6.0,
          //   height: 6.0,
          //   decoration: const BoxDecoration(
          //     borderRadius: BorderRadius.all(Radius.circular(3.0)),
          //     color: Colors.red,
          //   ),
          // ) :  const SizedBox(height: 5.0),
          // const SizedBox(height: 4),
          Image.asset(
            icon,
            width: index != currentIndex.value ? 24 : 26,
            height: index != currentIndex.value ? 24 : 26,
            color: index != currentIndex.value ? hintColor : defaultColor,
            fit: BoxFit.contain,
          ),
          // Image.asset(icon,color: index != currentIndex.value ? Colors.black : Colors.red),
          // Text(title),
        ],
      ),
    );
  }
  Widget addUser() {
    return InkWell(
      onTap: () => {
        Get.back(),
        Get.toNamed(AppRoutes.addAccount),
      },
      child: SizedBox(
        height: 75.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(
                color: hintColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: defaultColor),
            ),
            const SizedBox(width: 10.0),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(addAccount.tr, style: size14W500Default),
                ],
              ),
          ],
        ),
      ),
    );
  }
  Widget item({required MUser user, index}) {
    return Container(
      height: 75.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            child: Image.memory(
                user.avatarFile!,
                width: 50.0,
                height: 50.0,
                fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(user.idName!, style: size14W500Default),
                Text(user.name!, style: size12W400Hint),
              ],
            ),
          ),
          index == profileController.currentUser
              ? const Icon(Icons.check, color: Colors.deepOrange,)
              : const SizedBox(),
        ],
      ),
    );
  }
  Widget customTitle(index,title) {
    return Text(title);
  }
}
