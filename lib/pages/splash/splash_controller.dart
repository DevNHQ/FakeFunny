import 'dart:async';
import 'package:fake_funny/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with SingleGetTickerProviderMixin{

  @override
  Future<void> onInit() async{
    startTime();
    super.onInit();
  }
  startTime() {
    return Timer(const Duration(seconds: 1), () async {
      Get.offNamed(AppRoutes.dashboard);
    });
  }
}