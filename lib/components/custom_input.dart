import 'package:fake_funny/common/styles.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CustomInput extends StatelessWidget {
  final String? label;
  final String? errMessage;
  final String? hint;
  final String? title;
  final double? width;
  final int maxLines;
  final bool activeObscureText;
  final Function onChanged;
  final TextInputType textInputType;

  const CustomInput({
    Key? key,
    this.label,
    this.errMessage,
    this.textInputType = TextInputType.multiline,
    this.title,
    this.maxLines = 1,
    this.width,
    this.hint,
    this.activeObscureText = false,
    required this.onChanged,
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Padding(
                padding: EdgeInsets.only(
                    left: 5.0,
                    bottom: errMessage == null ? 5.0 : 0.0,
                    top: 16.0),
                child: Text(title!, style: size14W500Default),
              )
            : const SizedBox(),
        errMessage != null
            ? Padding(
                padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                child: Text(errMessage!, style: errText),
              )
            : const SizedBox(),
        Container(
          height: maxLines > 1 ? maxLines.toDouble() * 45.0 : 45.0,
          alignment: Alignment.centerLeft,
          width: width,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 12.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(appBorder)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: TextField(
            readOnly: false,
            autofocus: false,
            textAlignVertical: TextAlignVertical.top,
            expands: maxLines > 1 ? true : false,
            maxLines: maxLines > 1 ? null : maxLines,
            style: size14W500Default,
            keyboardType: textInputType,
            onChanged: (value) => onChanged(value),
            obscureText: activeObscureText ,
            decoration: InputDecoration.collapsed(
              hintText: '$hint ...',
              hintStyle: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
