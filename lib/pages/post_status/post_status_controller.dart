import 'dart:io';
import 'dart:typed_data';

import 'package:fake_funny/common/utils.dart';
import 'package:fake_funny/model/user.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostStatusController extends GetxController {
  final ImagePicker picker = ImagePicker();
  File? choseImage;
  MUser? user ;
  @override
  Future<void> onInit() async{
    // TODO: implement onInit
    super.onInit();
  }
  @override
  Future<void> onClose() async{
    // TODO: implement onClose
    super.onClose();
  }
  void getImage({type}) async{
    final XFile? image = await picker.pickImage(source: type == 0 ? ImageSource.gallery : ImageSource.camera);
    if(image != null) {
      File tempImage = await resizeWidth(File(image.path));
      user?.avatarFile =  Uint8List.fromList(tempImage.readAsBytesSync());
      user?.name = 'Test';
      update();
      print(user?.name);
    }
    update();
  }
}