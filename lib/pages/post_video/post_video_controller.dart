import 'dart:io';
import 'dart:typed_data';

import 'package:fake_funny/common/utils.dart';
import 'package:fake_funny/model/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostVideoController extends GetxController {
  final ImagePicker picker = ImagePicker();
  TextEditingController statusEditingController = TextEditingController(text: null);
  TextEditingController nameEditingController = TextEditingController(text: null);
  TextEditingController likeCountEditingController = TextEditingController(text: null);
  TextEditingController shareCountEditingController = TextEditingController(text: null);
  TextEditingController commentCountEditingController = TextEditingController(text: null);
  TextEditingController tagsEditingController = TextEditingController(text: null);
  TextEditingController musicEditingController = TextEditingController(text: null);
  File? choseImage;
  MPost? user  = MPost();
  @override
  Future<void> onInit() async{
    super.onInit();
  }
  @override
  Future<void> onClose() async{
    super.onClose();
  }
  void addFormData({type, value}) {
    switch (type) {
      case 0:
        user?.name = value;
        break;
      case 1:
        user?.status = value;
        break;
      case 2:
        user?.music = value;
        break;
      case 3:
        user?.status = value;
        break;
      case 4:
        user?.commentCount = value;
        break;
      case 5:
        user?.likesCount = value;
        break;
      case 6:
        user?.sharesCount = value;
        break;
    }
    update();
  }
  void getImage({type}) async{
    final XFile? image = await picker.pickImage(source: type == 0 ? ImageSource.gallery : ImageSource.camera);
    if(image != null) {
      File tempImage = await resizeWidth(File(image.path));
      user?.imageFile =  Uint8List.fromList(tempImage.readAsBytesSync());
      update();
    }
  }
}