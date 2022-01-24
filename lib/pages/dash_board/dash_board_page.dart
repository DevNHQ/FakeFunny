import 'package:fake_funny/common/styles.dart';
import 'package:fake_funny/components/custom_appbar.dart';
import 'package:fake_funny/components/custom_icon.dart';
import 'package:fake_funny/components/custom_image.dart';
import 'package:fake_funny/language/const.dart';
import 'package:fake_funny/pages/dash_board/dash_board_controller.dart';
import 'package:fake_funny/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../localization_service.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var controller = Get.put(DashBoardController());
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder<DashBoardController>(builder: (controller)  {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
            title: controller.appbarTitle(),
            widgetTitle: controller.profileTitle(),
            leadingIcon: controller.isCollapsed ? Icons.view_headline_outlined : Icons.clear_outlined,
            onLeadingAction: () => controller.switchAction(),
            actions: [
              CustomIcon(
                  icon: Icons.add,
                  alignment: Alignment.centerRight,
                  onPressed: () => Get.toNamed(AppRoutes.postOptions),
              ),
              CustomIcon(icon: Icons.mark_email_unread_sharp),
            ],
          ),
          body: Stack(
            children: [
              menu(context, controller),
              AnimatedPositioned(
                duration: controller.duration,
                top: 0,
                bottom: 0,
                curve: Curves.fastLinearToSlowEaseIn,
                left: controller.isCollapsed ? 0 : 0.6 * screenWidth,
                right: controller.isCollapsed ? 0 : -0.2 * screenWidth,
                child: ScaleTransition(
                  scale: controller.scaleAnimation,
                  child: Material(
                    animationDuration: controller.duration,
                    type: MaterialType.card,
                    elevation: 7,
                    borderRadius: BorderRadius.all(Radius.circular(!controller.isCollapsed ? 16.0 : 0.0)),
                    child: ClipRRect(
                      borderRadius:  BorderRadius.all(Radius.circular(!controller.isCollapsed ? 16.0 : 0.0)),
                      child: IndexedStack(
                        index: controller.currentIndex.value,
                        children: controller.dashBoardWidgets!,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar:Theme(
            data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent
            ),
            child: Container(
              height: MediaQuery.of(context).padding.bottom + 65.0,
              color: Colors.white,
              child: Obx(()=> BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.currentIndex.value,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.red,
                // selectedLabelStyle: textBottomActive,
                // unselectedLabelStyle: textBottomDefault,
                backgroundColor: Colors.white,
                onTap: (value) async{
                  controller.changeIndex(value);
                },
                items: [
                  BottomNavigationBarItem(icon: controller.customIcon(index: 0,icon: Icons.home_outlined,showBadge: false, title: home.tr),title: const SizedBox()),
                  BottomNavigationBarItem(icon: controller.customIcon(index: 1,icon: Icons.ad_units_rounded,showBadge: false,title: home.tr),title: const SizedBox()),
                  BottomNavigationBarItem(icon: controller.customIcon(index: 2,icon: Icons.account_balance_rounded,showBadge: false, title:  home.tr),title: const SizedBox()),
                  BottomNavigationBarItem(icon: controller.customIcon(index: 3,icon: Icons.add_alert,showBadge: true, title: home.tr),title: const SizedBox()),
                ],
              )),
            ),
          )
      );
    });
  }
  Widget menu(context, DashBoardController controller) {
    return SlideTransition(
      position: controller.slideAnimation,
      child: ScaleTransition(
        scale: controller.menuScaleAnimation,
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 16.0,top: 16.0),
                  child: Column(
                    children: [
                      const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        child: CustomImage(
                          width: 75.0,
                          image: avatarDefault,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text("Name",style: size16W700Default),
                    ],
                  ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.leftMenu.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 16),
                  itemBuilder: (context, index) {
                    var item = controller.leftMenu[index];
                    return InkWell(
                      onTap: () => controller.actionMenu(index: index, screen: item.screen),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.only(left: 16),
                        height: 40.0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(item.icon),
                            const SizedBox(width: 10.0),
                            Text(
                              item.title.tr,
                              style: size14W500Default,
                            ),
                          ],
                        ),
                      ),
                    );
                  },),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Copyrighted - ©DevNHQ', style: size12W500Default),
              ),
            ],
          ),
        )
      ),
    );
  }
  List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
    var list = <DropdownMenuItem<String>>[];
    LocalizationService.langs.forEach((key, value) {
      list.add(DropdownMenuItem<String>(
        value: key,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                key == 'vi' ? 'assets/images/vn.png' : 'assets/images/en.jpg',
                width: 20,
                height: 20
            ),
            const SizedBox(width: 16.0),
            Text(value),
          ],
        ),
      ));
    });
    return list;
  }
}