import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class PostVideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  final ImagePicker picker = ImagePicker();
  File? choseVideo;
  bool startedPlaying = false;
  @override
  Future<void> onInit() async{
    super.onInit();
  }
  @override
  Future<void> onClose() async{
    videoPlayerController.dispose();
    startedPlaying = false;
    update();
    super.onClose();
  }
  initVideo({value}) {
    videoPlayerController = VideoPlayerController.file(value);
    videoPlayerController.addListener(() {
      if (startedPlaying && !videoPlayerController.value.isPlaying) {
        Get.back();
      }
    });
  }

  Future<bool> started() async {
    await videoPlayerController.initialize();
    await videoPlayerController.play();
    startedPlaying = true;
    update();
    return true;
  }
  void getVideo() async{
    final XFile? image = await picker.pickVideo(source: ImageSource.gallery);
    choseVideo = File(image!.path);
    update();
    initVideo(value: choseVideo);
  }
}