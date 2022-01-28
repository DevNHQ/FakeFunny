import 'package:fake_funny/pages/post_video/post_video_controller.dart';
import 'package:get/get.dart';

class PostVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostVideoController>(() => PostVideoController());
  }
  
}