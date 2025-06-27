import 'package:flutter/material.dart';
import '../molecules/style_item.dart';
import '../atoms/atomic_text.dart';
import '../models/service_data.dart';

class StylesGrid extends StatelessWidget {
  final List<StyleData> styles;
  final Function(int)? onStyleSelected;
  final int? selectedIndex;

  const StylesGrid({
    super.key,
    required this.styles,
    this.onStyleSelected,
    this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: styles.asMap().entries.map((entry) {
          final index = entry.key;
          final style = entry.value;
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: StyleItem(
              imageUrl: style.imageUrl,
              name: style.name,
              isActive: selectedIndex == index,
              onTap: () {
                onStyleSelected?.call(index);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
