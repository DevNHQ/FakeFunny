import 'package:fake_funny/pages/dash_board/dash_board_controller.dart';
import 'package:fake_funny/pages/add_account/add_account_controller.dart';
import 'package:fake_funny/pages/home/home_controller.dart';
import 'package:fake_funny/pages/post_video/post_video_controller.dart';
import 'package:fake_funny/pages/profile/profile_controller.dart';
import 'package:get/get.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<AddAccountController>(() => AddAccountController());
    Get.lazyPut<PostVideoController>(() => PostVideoController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}