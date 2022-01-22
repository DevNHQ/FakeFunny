import 'dart:async';
import 'package:fake_funny/common/styles.dart';
import 'package:fake_funny/components/custom_appbar.dart';
import 'package:fake_funny/components/custom_tabbar.dart';
import 'package:fake_funny/pages/profile/profile_controller.dart';
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
                      background: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 16.0),
                          const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(100.0)),
                            // child: CachedNetworkImage(
                            //   imageUrl: noImage1,
                            //   placeholder: (context, url) =>  Image.asset('assets/images/placeholder.png',fit: BoxFit.cover,width: MediaQuery.of(context).size.width),
                            //   errorWidget: (context, url, error) => Image.asset('assets/images/placeholder.png',fit: BoxFit.cover,width: MediaQuery.of(context).size.width),
                            //   fit: BoxFit.cover,
                            //   width: 125.0,
                            //   height: 125.0,
                            // ),
                          ),
                          const SizedBox(height: 10.0),
                          Text("Nguyen Hong Quang",style: size16W700Default),
                          const SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(width: 16.0),
                              customBox(title: 'Const.post',value: "5"),
                              const Text("|",style:  TextStyle(color: Colors.grey)),
                              customBox(title: 'Const.following',value: "1"),
                              const Text("|",style: TextStyle(color: Colors.grey)),
                              customBox(title: 'Const.followed',value: "1.5m"),
                              const SizedBox(width: 16.0),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          InkWell(
                              onTap: (){

                              },
                              child: Text("Chỉnh sửa hồ sơ",
                                  style: size12W500Default,
                              )
                          ),
                        ],
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
        Text(value,style: size12W500Default),
        const SizedBox(height: 5.0),
        Text(title,style: size12W500Default),
      ],
    );
  }
}