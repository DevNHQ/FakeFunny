import 'package:flutter/widgets.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    this.imageRatio = 1.618,
    this.placeholder,
    this.image,
    this.height,
    this.fit,
    required this.width,
  }) : super(key: key);
  final String? image;
  final double width;
  final double? height;
  final double imageRatio;
  final String? placeholder;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      image: image!,
      placeholder: placeholder ?? 'assets/images/placeholder.jpg',
      width: width,
      height: height ?? width,
      fit: fit ?? BoxFit.contain,
      fadeOutDuration: const Duration(milliseconds: 100),
      fadeInDuration: const Duration(milliseconds: 200),
    );
  }
}