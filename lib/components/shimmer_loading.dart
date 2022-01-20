import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

enum SHIMMER {HOME}
// ignore: must_be_immutable
class ShimmerLoading extends StatelessWidget {
  ShimmerLoading({Key? key, required this.type}) : super(key: key);
  SHIMMER type;
  @override
  Widget build(BuildContext context) {
    switch (type) {
      case SHIMMER.HOME:
        return homeLoading();
        break;
    }
  }
}
Widget homeLoading() {
  return SizedBox(
    width: 200.0,
    height: 100.0,
    child: ListView.builder(
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.yellow,
          child: const Text(
            'Shimmer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    ),
  );
}
