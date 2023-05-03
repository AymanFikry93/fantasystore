import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingList extends StatelessWidget {
  final bool? enabled;
  final Widget child;
  final int childHeight;
  final EdgeInsetsGeometry? padding;
  const LoadingList({super.key, this.enabled, required this.child, required this.childHeight,this.padding});

  @override
  Widget build(BuildContext context) {
    var listCount = MediaQuery.of(context).size.height / childHeight;
    return Container(
      padding: padding,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Shimmer.fromColors(
          baseColor: Theme.of(context).primaryColor.withOpacity(0.5),
          highlightColor: Theme.of(context).colorScheme.secondary.withOpacity(.3),
          enabled: enabled ?? false,
          child: ListView.builder(
            itemBuilder: (_, __) => child,
            itemCount: listCount.floor(),
          )),
    );
  }
}
