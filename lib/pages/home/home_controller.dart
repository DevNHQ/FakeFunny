import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin{
  late Animation animation1;
  late AnimationController animationController1;
  late Animation animation2;
  late AnimationController animationController2;
  int currentTab = 1;
  @override
  Future<void> onInit() async{
    animationController1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));
    animation1 = Tween(begin: 14.0, end: 16.0).animate(
        CurvedAnimation(curve: Curves.bounceOut, parent: animationController1));
    animationController2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));
    animation2 = Tween(begin: 14.0, end: 16.0).animate(
        CurvedAnimation(curve: Curves.bounceOut, parent: animationController2));
    animationController2.forward();
    super.onInit();
  }
  @override
  Future<void> onClose() async {
    animationController1.dispose();
    animationController2.dispose();
    super.onClose();
  }
  void updateAnimation1() {
    animationController2.reset();
    animationController1.reset();
    animationController1.forward();
    update();
  }
  void updateAnimation2() {
    animationController1.reset();
    animationController2.reset();
    animationController2.forward();
    update();
  }
  void changeTab({value}) {
    currentTab = value;
    update();
  }
}