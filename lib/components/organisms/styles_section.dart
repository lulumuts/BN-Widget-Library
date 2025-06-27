import 'package:flutter/material.dart';
import '../molecules/style_item.dart';
import '../atoms/atomic_text.dart';
import '../models/service_data.dart';

class StylesSection extends StatelessWidget {
  final List<StyleData> styles;
  final VoidCallback? onStyleSelected;

  const StylesSection({
    super.key,
    required this.styles,
    this.onStyleSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 10),
          child: AtomicText.heading2('Our Styles'),
        ),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: styles.length,
            itemBuilder: (context, index) {
              final style = styles[index];
              return Padding(
                padding:
                    EdgeInsets.only(right: index < styles.length - 1 ? 16 : 0),
                child: StyleItem(
                  imageUrl: style.imageUrl,
                  name: style.name,
                  onTap: () => onStyleSelected?.call(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
