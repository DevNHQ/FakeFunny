import 'package:fake_funny/pages/dash_board/dash_board_controller.dart';
import 'package:fake_funny/pages/profile/profile_controller.dart';
import 'package:get/get.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}