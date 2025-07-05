import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingStars extends StatelessWidget {
  final int filledStars;
  final double size;

  const RatingStars({
    super.key,
    this.filledStars = 0,
    this.size = 56,
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
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        );
      }),
    );
  }
}
