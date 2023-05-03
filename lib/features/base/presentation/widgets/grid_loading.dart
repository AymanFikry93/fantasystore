import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingGrid extends StatelessWidget {
  final bool? enabled;
  final Widget child;
  final int childHeight;
  final EdgeInsetsGeometry? padding;
  const LoadingGrid({super.key, this.enabled, required this.child, required this.childHeight,this.padding});

  @override
  Widget build(BuildContext context) {
    var listCount = (MediaQuery.of(context).size.height / childHeight)*2;
    return Container(
      padding: padding,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Shimmer.fromColors(
          baseColor: Theme.of(context).primaryColor.withOpacity(0.2),
          highlightColor: Theme.of(context).primaryColorDark.withOpacity(0.1),//Theme.of(context).colorScheme.secondary.withOpacity(.3),
          enabled: enabled ?? false,
          child: GridView.builder(
            itemBuilder: (_, __) => child,
            itemCount: listCount.floor(),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.7)
          )),
    );
  }
}
