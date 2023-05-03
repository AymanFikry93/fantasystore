import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SelectionShimmerItem extends StatelessWidget {
  const SelectionShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: const Center(
            child: Text(
          "Alex",
          style: TextStyle(color: Colors.transparent),
        )),
      ),
    );
  }
}
