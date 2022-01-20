import 'package:fake_funny/pages/language/language_controller.dart';
import 'package:fake_funny/pages/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}