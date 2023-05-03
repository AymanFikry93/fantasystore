import 'package:flutter/material.dart';

class ShimmerText extends StatelessWidget {
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  const ShimmerText({Key? key, this.height, this.width, this.margin, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: height ?? 20,
        width: width,
        decoration: BoxDecoration(
          borderRadius: borderRadius??BorderRadius.circular(5),
          color: Colors.black,
        ),
      ),
    );
  }
}
