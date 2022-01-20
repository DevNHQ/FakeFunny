import 'package:fake_funny/common/styles.dart';
import 'package:fake_funny/language/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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