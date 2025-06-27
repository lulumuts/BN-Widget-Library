import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AtomicButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isPrimary;
  final bool isSmall;
  final IconData? icon;
  final AtomicIconPosition iconPosition;
  final bool active;

  const AtomicButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isPrimary = true,
    this.isSmall = false,
    this.icon,
    this.iconPosition = AtomicIconPosition.left,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isPrimary ? Colors.white : const Color(0xFF332749);
    final bgColor = isPrimary ? const Color(0xFF332749) : Colors.transparent;
    final borderColor =
        isPrimary ? Colors.transparent : const Color(0xFF332749);

    final height = isSmall ? 36.0 : 45.0;
    final fontSize = isSmall ? 14.0 : 16.0;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF7F38FF) : bgColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: active ? const Color(0xFF7F38FF) : borderColor,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null && iconPosition == AtomicIconPosition.left)
              Icon(icon, size: 18, color: color),
            if (icon != null && iconPosition == AtomicIconPosition.left)
              const SizedBox(width: 8),
            Text(
              text,
              style: GoogleFonts.leagueSpartan(
                color: color,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (icon != null && iconPosition == AtomicIconPosition.right)
              const SizedBox(width: 8),
            if (icon != null && iconPosition == AtomicIconPosition.right)
              Icon(icon, size: 18, color: color),
          ],
        ),
      ),
    );
  }
}

enum AtomicIconPosition { left, right }
