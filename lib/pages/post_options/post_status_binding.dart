import 'package:fake_funny/pages/post_video/add_account_controller.dart';
import 'package:get/get.dart';

class PostStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAccountController>(() => AddAccountController());
  }
  
}