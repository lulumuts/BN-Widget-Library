import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final List<Color>? colors;
  final Alignment? center;
  final double? radius;

  const GradientBackground({
    super.key,
    required this.child,
    this.colors,
    this.center,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: center ?? const Alignment(0.5, 0.5),
          radius: radius ?? 1.0,
          colors: colors ??
              const [
                Color(0xFF7F38FF),
                Color(0xFFCBAEFF),
                Color(0xFFDECCFF),
                Color(0xFFEEE4FF),
                Colors.white,
              ],
        ),
      ),
      child: child,
    );
  }
}
