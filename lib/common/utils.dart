import 'dart:io';

import 'package:fake_funny/common/styles.dart';
import 'package:fake_funny/language/const.dart';
import 'package:fake_funny/library/FlutterResizeImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

dynamic resizeWidth(File file) async{
  ImageProperties properties = await FlutterResizeImage.getImageProperties(file.path);
  File compressedFile = await FlutterResizeImage.compressImage(file.path, quality: 100,targetWidth:properties.width! > 550 ? 550 : properties.width!,targetHeight:properties.width! > 550 ? (properties.height! * 550 / properties.width!).round() : properties.height!);
  return compressedFile;
}

bool validateEmail(String value) {
  RegExp regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  return (!regex.hasMatch(value)) ? false : true;
}

showAlertDialog(
    {required BuildContext context,
    String? acceptTitle,
    String? title,
    String? content,
    VoidCallback? onPress,
    bool hideCancel = true}) {
  Widget acceptButton = TextButton(
    child: Text(acceptTitle ?? "Ok", style: alertStyle),
    onPressed: onPress ?? () {},
  );
  Widget cancelButton = TextButton(
    child: Text(cancel.tr, style: alertStyle),
    onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
  );
  AlertDialog alert = AlertDialog(
    title:  Text(title ?? notice.tr, style: size16W500Default) ,
    content: content != null ?  Text(content) : null,
    actions: [
      hideCancel ? cancelButton : const SizedBox(),
      acceptButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}