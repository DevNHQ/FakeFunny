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
                    elevation:2,
                    flexibleSpace: FlexibleSpaceBar(
                      background: GetBuilder<ProfileController>(builder: (controller) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 16.0),
                              ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                                child: controller.user.avatarFile != null ? Image.memory(
                                  controller.user.avatarFile!,
                                  fit: BoxFit.cover,
                                  width: 125.0,
                                  height: 125.0,
                                ) : Image.asset(
                                  'assets/images/placeholder.jpg',
                                  fit: BoxFit.cover,
                                  width: 125.0,
                                  height: 125.0,
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
                              InkWell(
                                  onTap: () => Get.toNamed(AppRoutes.addAccount, arguments: controller.user),
                                  child: Text(
                                    editProfile.tr,
                                    style: size12W500Default,
                                  )
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    centerTitle: true,
                    expandedHeight: 330,
                    bottom: CustomTabBar(
                      color: Colors.white,
                      tabBar: TabBar(
                        onTap: (i) async{
                        },
                        isScrollable: true,
                        tabs: controller.tabs,
                        indicatorColor: Colors.black,
                        controller: controller.tabController,
                        unselectedLabelColor:Colors.grey,
                        labelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
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
        Text(value,style: size14W500Default),
        const SizedBox(height: 5.0),
        Text(title,style: size12W500Hint),
      ],
    );
  }
}