import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

class CustomImageFile extends StatelessWidget {
  const CustomImageFile({
    Key? key,
    this.imageRatio = 1.618,
    this.placeholder,
    required this.image,
    this.height,
    this.fit,
    required this.width,
  }) : super(key: key);
  final dynamic image;
  final double width;
  final double? height;
  final double imageRatio;
  final String? placeholder;
  final BoxFit? fit;
  Future<File> getLocalFile(String filename) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    File f = File('$dir/$filename');
    return f;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getLocalFile(image),
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          return snapshot.data != null
              ? Image.file(snapshot.data!, width: width, height: height, fit: fit)
              : Image.asset('assets/images/placeholder.jpg',
                  width: width, height: height);
        });
  }
}