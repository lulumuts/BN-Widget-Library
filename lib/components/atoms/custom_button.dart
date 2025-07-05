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
    final colorScheme = Theme.of(context).colorScheme;

    // Material 3 color logic with vibrant colors
    Color backgroundColor;
    Color textColor;
    Color? borderColor;
    double elevation = 1.0;
    double borderRadius =
        widget.isSmall ? 20.0 : 28.0; // Material 3 uses larger radius

    if (widget.active || _isPressed) {
      if (widget.isPrimary) {
        backgroundColor = const Color(0xFF7F38FF); // Vibrant purple
        textColor = Colors.white;
        elevation = 2.0;
      } else {
        backgroundColor = const Color(0xFFF5F5F5); // Light gray
        textColor = const Color(0xFF332749); // Dark purple
        borderColor = const Color(0xFF332749);
        elevation = 1.0;
      }
    } else {
      if (widget.isPrimary) {
        backgroundColor = const Color(0xFF332749); // Dark purple
        textColor = Colors.white;
        elevation = 1.0;
      } else {
        backgroundColor = Colors.white;
        textColor = const Color(0xFF332749); // Dark purple
        borderColor = const Color(0xFF332749);
        elevation = 0.0;
      }
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onPressed,
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        borderRadius: BorderRadius.circular(borderRadius),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: widget.isSmall ? 16.0 : 24.0,
            vertical: widget.isSmall ? 8.0 : 12.0,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: borderColor != null
                ? Border.all(color: borderColor, width: 1.0)
                : null,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: elevation * 2,
                offset: Offset(0, elevation),
              ),
            ],
          ),
          child: IntrinsicWidth(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null &&
                    widget.iconPosition == IconPosition.left) ...[
                  Icon(
                    widget.icon,
                    size: widget.isSmall ? 16.0 : 20.0,
                    color: textColor,
                  ),
                  const SizedBox(width: 8),
                ],
                Flexible(
                  child: Text(
                    widget.text,
                    style: GoogleFonts.leagueSpartan(
                      color: textColor,
                      fontSize: widget.isSmall ? 14.0 : 16.0,
                      fontWeight: FontWeight.w500,
                      height: 1.0, // Remove extra line height
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (widget.icon != null &&
                    widget.iconPosition == IconPosition.right) ...[
                  const SizedBox(width: 8),
                  Icon(
                    widget.icon,
                    size: widget.isSmall ? 16.0 : 20.0,
                    color: textColor,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
