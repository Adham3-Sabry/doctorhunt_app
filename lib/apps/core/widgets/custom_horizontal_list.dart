import 'package:flutter/material.dart';

class CustomHorizontalList<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final double spacing;
  final EdgeInsetsGeometry padding;
  final ScrollPhysics? physics;

  const CustomHorizontalList({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.spacing = 12,
    this.padding = EdgeInsets.zero,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: physics ?? const BouncingScrollPhysics(),
        padding: padding,
        itemCount: items.length,
        separatorBuilder: (_, __) {
          return SizedBox(width: spacing);
        },
        itemBuilder: (context, index) {
          return itemBuilder(context, items[index], index);
        },
      ),
    );
  }
}
