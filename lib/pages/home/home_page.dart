import 'package:fake_funny/common/styles.dart';
import 'package:fake_funny/common/utils.dart';
import 'package:fake_funny/components/custom_image.dart';
import 'package:fake_funny/language/const.dart';
import 'package:fake_funny/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          top: true,
          child: GetBuilder<HomeController>(builder: (controller) {
            return Stack(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: PageView.builder(
                        itemCount: 10,
                        pageSnapping: true,
                        physics: const  BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height ,
                            child: Stack(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height ,
                                  color: Colors.black,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height / 3,
                                      left: 16.0,
                                      right: 16.0,),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text('@Dev', style: size12W700White),
                                            const SizedBox(height: 10.0),
                                            Flexible(child: Text('Pha ke không giống đời không nể :))', style: size11W400White, maxLines: 3,)),
                                            const SizedBox(height: 5.0),
                                            Flexible(child: Text('#fake #funny', style: size11W500White, maxLines: 1,)),
                                            const SizedBox(height: 16.0),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/icons/music.png',
                                                    width: 12,
                                                    height: 12,
                                                    color: whiteColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 14.0,
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      'Fake fake fake',
                                                      style: size10W400White,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            const SizedBox(height: 16.0),
                                            ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 59.0,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  decoration:  BoxDecoration(
                                                    border: Border.all(color: whiteColor, width: 1.5),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const ClipRRect(
                                                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                                    child: CustomImage(
                                                      image: avatarDefault,
                                                      width: 50.0,
                                                      height: 50.0,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  left: 17,
                                                  child: Container(
                                                    padding: const EdgeInsets.all(3.0),
                                                    decoration: const BoxDecoration(
                                                      color: Colors.red,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: const Icon(Icons.add, color: whiteColor, size: 12),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 20.0,),
                                          actionWidget(
                                            image: 'assets/icons/heart.png',
                                            value: parserCount(value: 329499),
                                            onPress: () => {},
                                          ),
                                          const SizedBox(height: 20.0,),
                                          actionWidget(image: 'assets/icons/message.png', value: parserCount(value: 124)),
                                          const SizedBox(height: 20.0,),
                                          actionWidget(image: 'assets/icons/share.png', value: parserCount(value: 42)),
                                          const Expanded(
                                            child: SizedBox(),
                                          ),
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/icons/vinyl.png',
                                                width: 45,
                                                height: 45,
                                              ),
                                              const ClipRRect(
                                                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                                child: CustomImage(
                                                  image: avatarDefault,
                                                  width: 25.0,
                                                  height: 25.0,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 7.0),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },),
                    ),
                    Image.asset(
                        'assets/icons/play_video.png',
                        color: hintColor,
                        width: 36,
                        height: 36,
                      ),
                    ],
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 7.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/icons/live.png',
                          width: 24,
                          height: 24,
                        ),
                        Row(
                          children: [
                            AnimatedBuilder(
                              animation: controller.animationController1,
                              builder: (context, child) {
                                return InkWell(
                                  onTap: () => {
                                    controller.updateAnimation1(),
                                    controller.changeTab(value: 0),
                                  },
                                    child: Text(
                                      following.tr,
                                      style: controller.currentTab == 0
                                          ? customStyle(
                                              fontWeight: w700,
                                              fontSize:controller.animation1.value,
                                              color: whiteColor,)
                                          : customStyle(
                                              fontWeight: w500,
                                              fontSize:controller.animation1.value,
                                              color: const Color(0xFFB8CCDC),),
                                    ),
                                  );
                              },
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                              width: 2.5,
                              height: 7,
                              color: Color(0xFFB8CCDC),
                            ),
                            AnimatedBuilder(
                              animation: controller.animationController2,
                              builder: (context, child) {
                                return InkWell(
                                  onTap: () => {
                                    controller.updateAnimation2(),
                                    controller.changeTab(value: 1),
                                  },
                                  child: Text(
                                      forYou.tr,
                                      style: controller.currentTab == 1
                                          ? customStyle(
                                              fontWeight: w700,
                                              fontSize:controller.animation2.value,
                                              color: whiteColor)
                                          : customStyle(
                                              fontWeight: w500,
                                              fontSize: controller.animation2.value,
                                              color: const Color(0xFFB8CCDC),),
                                    ),
                                  );
                              },
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/icons/search.png',
                          width: 32,
                          height: 32,
                          color: whiteColor,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
            },
          ),
        ),
      ),
    );
  }
}
customStyle({fontSize, fontWeight, color}) {
  return GoogleFonts.getFont(
    font,
    textStyle: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}
Widget actionWidget({image, value, color, onPress}) {
  return InkWell(
    onTap: onPress,
    child: Column(
      children: [
        Image.asset(
          image,
          width: 24.0,
          height: 24.0,
          color: color ?? whiteColor,
        ),
        const SizedBox(height: 5.0,),
        Text(value, style: size14W500White),
      ],
    ),
  );
}
