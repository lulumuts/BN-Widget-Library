import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum IconPosition { left, right }

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool isSmall;
  final bool active;
  final IconData? icon;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.isSmall = false,
    this.active = false,
    this.icon,
    this.iconPosition = IconPosition.left,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    BoxBorder? border;
    double borderRadius = 24.0;

    if (widget.active) {
      backgroundColor = const Color(0xFF7F38FF);
      border = widget.isPrimary
          ? null
          : Border.all(color: const Color(0xFF332749), width: 1.0);
    } else if (_isPressed) {
      backgroundColor = const Color(0xFF7F38FF);
      border = widget.isPrimary
          ? null
          : Border.all(color: const Color(0xFF332749), width: 1.0);
    } else if (widget.isPrimary) {
      backgroundColor = const Color(0xFF332749);
      border = null;
    } else {
      backgroundColor = const Color(0xFF332749);
      border = Border.all(color: const Color(0xFF332749), width: 1.0);
    }

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(
          horizontal: widget.isSmall ? 16.0 : 24.0,
          vertical: widget.isSmall ? 8.0 : 12.0,
        ),
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            side: border is Border
                ? (border as Border).top // All sides are the same
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null &&
                widget.iconPosition == IconPosition.left) ...[
              Icon(
                widget.icon,
                size: widget.isSmall ? 16.0 : 20.0,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              widget.text,
              style: GoogleFonts.leagueSpartan(
                color: Colors.white,
                fontSize: widget.isSmall ? 14.0 : 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (widget.icon != null &&
                widget.iconPosition == IconPosition.right) ...[
              const SizedBox(width: 8),
              Icon(
                widget.icon,
                size: widget.isSmall ? 16.0 : 20.0,
                color: Colors.white,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
