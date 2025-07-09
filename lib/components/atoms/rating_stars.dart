import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingStars extends StatelessWidget {
  final int filledStars;
  final double size;
  final Color? starColor;

  const RatingStars({
    super.key,
    this.filledStars = 0,
    this.size = 56,
    this.starColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final asset = index < filledStars
            ? 'assets/icons/star_filled.svg'
            : 'assets/icons/star_outline.svg';
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: SvgPicture.asset(
            asset,
            width: size,
            height: size,
            colorFilter: ColorFilter.mode(
              starColor ?? const Color(0xFF7F38FF),
              BlendMode.srcIn,
            ),
          ),
        );
      }),
    );
  }
}
