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
dynamic parserCount({value}) {
  if (value < 10000) {
    return value.toString();
  } else if (value >= 10000 && value < 100000) {
    return value.toString().substring(0, 2) + "." + value.toString().substring(2, 3) + "K" ;
  } else if (value >= 100000 && value < 1000000) {
    return value.toString().substring(0, 3) + "." + value.toString().substring(3, 4) + "K" ;
  } else if (value >= 1000000 && value < 10000000) {
    return value.toString().substring(0, 1) + "." + value.toString().substring(1, 2) + "T" ;
  } else if (value >= 10000000 && value < 100000000) {
    return value.toString().substring(0, 2) + "." + value.toString().substring(2, 3) + "T" ;
  } else if (value >= 100000000 && value < 1000000000) {
    return value.toString().substring(0, 3) + "." + value.toString().substring(3, 4) + "T" ;
  } else if (value >= 1000000000 && value < 10000000000) {
    return value.toString().substring(0, 1) + "." + value.toString().substring(1, 2) + "B" ;
  } else if (value >= 10000000000 && value < 100000000000) {
    return value.toString().substring(0, 2) + "." + value.toString().substring(2, 3) + "B" ;
  }
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