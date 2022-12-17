import 'package:flutter/material.dart';

class ViewGrid extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;

  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  bool shrinkWrap;
  ScrollPhysics? physics;

  ViewGrid(
      {Key? key,
      this.physics,
      this.shrinkWrap = true,
      required this.crossAxisCount,
      required this.childAspectRatio,
      required this.itemBuilder,
      required this.itemCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: physics,
        shrinkWrap: shrinkWrap,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, childAspectRatio: childAspectRatio),
        itemBuilder: itemBuilder,
        itemCount: itemCount);
  }
}
