import 'dart:async';
import 'package:fake_funny/common/styles.dart';
import 'package:fake_funny/common/utils.dart';
import 'package:fake_funny/components/custom_appbar.dart';
import 'package:fake_funny/components/custom_tabbar.dart';
import 'package:fake_funny/language/const.dart';
import 'package:fake_funny/pages/profile/profile_controller.dart';
import 'package:fake_funny/routes/app_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body:  NestedScrollView(
          // controller: scrollController,
            physics: const ScrollPhysics(parent: PageScrollPhysics()),
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                    floating: true,
                    pinned: true,
                    stretch: true,
                    backgroundColor: Colors.white,
                    forceElevated: value,
                    brightness: Brightness.light,
                    elevation:1,
                    flexibleSpace: FlexibleSpaceBar(
                      background: GetBuilder<ProfileController>(builder: (controller) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 10.0),
                              ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                                child: controller.user.avatarFile != null ? Image.memory(
                                  controller.user.avatarFile!,
                                  fit: BoxFit.cover,
                                  width: 100.0,
                                  height: 100.0,
                                ) : Image.asset(
                                  'assets/images/placeholder.jpg',
                                  fit: BoxFit.cover,
                                  width: 100.0,
                                  height: 100.0,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Text(controller.user.idName != null ? controller.user.idName! : '@id',style: size16W700Default),
                              const SizedBox(height: 25.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const SizedBox(width: 16.0),
                                  customBox(title: following.tr ,value: parserCount(value: controller.user.totalLike)),
                                  Text("|",style:  size10W400Hint),
                                  customBox(title: followers.tr ,value: parserCount(value: controller.user.follower)),
                                  Text("|",style: size10W400Hint),
                                  customBox(title: like.tr ,value: parserCount(value: controller.user.following)),
                                  const SizedBox(width: 16.0),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () => Get.toNamed(AppRoutes.addAccount, arguments: controller.user),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width / 3,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: lightGrey),
                                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                      ),
                                      child: Text(
                                        editProfile.tr,
                                        style: size14W500Default,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width:5.0),
                                  Container(
                                    width: 35,
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: lightGrey),
                                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                    ),
                                    child: Image.asset(
                                      'assets/icons/bookmark.png',
                                      width: 18,
                                      height: 18,
                                      fit: BoxFit.contain,
                                      color: defaultColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16.0,),
                              Text('bio', style: size14W500Default,),
                              const SizedBox(height: 16.0,),
                            ],
                          );
                        },
                      ),
                    ),
                    centerTitle: true,
                    expandedHeight: 366,
                    bottom: CustomTabBar(
                      color: Colors.white,
                      tabBar: TabBar(
                        onTap: (i) async{
                        },
                        isScrollable: false,
                        tabs: controller.tabs,
                        indicatorColor: defaultColor,
                        controller: controller.tabController,
                        unselectedLabelColor: hintColor,
                        labelColor: Colors.red,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 2,
                        indicatorPadding: const EdgeInsets.only(left: 8,right: 8,bottom: 0),
                        labelPadding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 0),
                        dragStartBehavior: DragStartBehavior.down,

                      ),
                    )
                ),
              ];
            },
            body: TabBarView(
              children: controller.tabBody,
              physics: const BouncingScrollPhysics(),
              controller: controller.tabController,
            )
        )
    );
  }
  Widget customBox({title,value}){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(value,style: size16W700Default),
        const SizedBox(height: 5.0),
        Text(title,style: size12W400Hint),
      ],
    );
  }
}