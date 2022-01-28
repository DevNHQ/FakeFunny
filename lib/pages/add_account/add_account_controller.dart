import 'dart:io';
import 'dart:typed_data';

import 'package:fake_funny/common/storage_manager.dart';
import 'package:fake_funny/common/utils.dart';
import 'package:fake_funny/database/database_manager.dart';
import 'package:fake_funny/model/user.dart';
import 'package:fake_funny/pages/profile/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddAccountController extends GetxController {
  final ImagePicker picker = ImagePicker();
  late ProfileController profileController = Get.put(ProfileController());
  TextEditingController nameEditingController = TextEditingController(text: null);
  TextEditingController idNameEditingController = TextEditingController(text: null);
  TextEditingController totalLikeEditingController = TextEditingController(text: null);
  TextEditingController followingEditingController = TextEditingController(text: null);
  TextEditingController followerEditingController = TextEditingController(text: null);
  File? choseImage;
  MUser? user  = MUser();
  MUser? initUser = Get.arguments;
  @override
  Future<void> onInit() async{
    initData();
    super.onInit();
  }
  @override
  Future<void> onClose() async{
    // TODO: implement onClose
    super.onClose();
  }
  void initData() {
    if(initUser != null) {
      user = initUser;
      nameEditingController.text = initUser!.name!;
      idNameEditingController.text = initUser!.idName!;
      totalLikeEditingController.text = initUser!.totalLike.toString();
      followingEditingController.text = initUser!.following.toString();
      followerEditingController.text = initUser!.follower.toString();
    }
  }
  void deleteProfile () {
    StorageManager.saveData('USER', 0);
    DataBaseManager().removeUser(id: initUser!.id!).then((value) => {
      Get.back(),
      profileController.initData(isAdd: false),
    });
  }
  void addUser({id}) {
    if(initUser != null) {
      StorageManager.saveData('USER', user!.id! - 1);
      DataBaseManager().updateUser(user: user!, id: user!.id!).then((value) => {
        if (value != null) {
          Get.back(),
          profileController.initData(isAdd: false),
        }
      });
    } else {
      DataBaseManager().addUser(user!).then((value) => {
        if (value != null) {
          Get.back(),
          profileController.initData(isAdd: true),
        }
      });
    }
  }
  void addFormData({type, value}) {
    switch (type) {
      case 0:
        user?.name = value;
        break;
      case 1:
        user?.idName = value;
        break;
      case 2:
        user?.totalLike = value;
        break;
      case 3:
        user?.following = value;
        break;
      case 4:
        user?.follower = value;
        break;
    }
    update();
  }
  void getImage({type}) async{
    final XFile? image = await picker.pickImage(source: type == 0 ? ImageSource.gallery : ImageSource.camera);
    if(image != null) {
      File tempImage = await resizeWidth(File(image.path));
      user?.avatarFile =  Uint8List.fromList(tempImage.readAsBytesSync());
      update();
    }
  }
}