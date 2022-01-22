import 'package:fake_funny/pages/post_status/post_status_controller.dart';
import 'package:get/get.dart';

class PostStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostStatusController>(() => PostStatusController());
  }
  
}