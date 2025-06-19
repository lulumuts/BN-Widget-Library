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
          center: center ?? const Alignment(0.50, 0.50),
          radius: radius ?? 0.50,
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
