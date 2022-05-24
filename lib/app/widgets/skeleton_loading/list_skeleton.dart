import 'package:flutter/material.dart';

import 'item_skeleton.dart';

class ListSkeleton extends StatelessWidget {
  const ListSkeleton({
    Key? key,
    this.itemSkeleton,
    this.cacheExtent = 16 / 9,
    this.axis = Axis.vertical,
    this.separator,
    this.itemCount = 20,
    this.scrollPhysics,
    this.padding,
  }) : super(key: key);
  final double cacheExtent;
  final Widget? separator, itemSkeleton;
  final Axis axis;
  final int itemCount;
  final ScrollPhysics? scrollPhysics;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ItemSkeleton(
      child: ListView.separated(
        physics: scrollPhysics,
        shrinkWrap: true,
        scrollDirection: axis,
        padding: padding,
        cacheExtent: cacheExtent,
        itemBuilder: (context, index) {
          return itemSkeleton ??
              ItemSkeleton(
                width: MediaQuery.of(context).size.width * .7,
                height: 100,
              );
        },
        separatorBuilder: (BuildContext context, int index) {
          return separator ??
              (axis == Axis.vertical
                  ? const SizedBox(height: 10)
                  : const SizedBox(width: 10));
        },
        itemCount: itemCount,
      ),
    );
  }
}
