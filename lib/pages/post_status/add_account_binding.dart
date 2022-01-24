import 'package:fake_funny/pages/post_status/add_account_controller.dart';
import 'package:get/get.dart';

class AddAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAccountController>(() => AddAccountController());
  }
  
}