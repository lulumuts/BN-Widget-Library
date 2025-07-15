import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AtomicIconPosition { left, right }

class AtomicButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isSmall;
  final IconData? icon;
  final AtomicIconPosition iconPosition;
  final bool active;

  const AtomicButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isSmall = false,
    this.icon,
    this.iconPosition = AtomicIconPosition.left,
    this.active = false,
  });

  @override
  State<AtomicButton> createState() => _AtomicButtonState();
}

class _AtomicButtonState extends State<AtomicButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final height = widget.isSmall ? 36.0 : 45.0;
    final fontSize = widget.isSmall ? 14.0 : 16.0;
    final backgroundColor =
        _isHovered ? const Color(0xFF332749) : Colors.transparent;
    final textColor = _isHovered ? Colors.white : const Color(0xFF332749);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: const Color(0xFF332749),
              width: 2,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null &&
                  widget.iconPosition == AtomicIconPosition.left)
                Icon(widget.icon, size: 18, color: textColor),
              if (widget.icon != null &&
                  widget.iconPosition == AtomicIconPosition.left)
                const SizedBox(width: 8),
              Text(
                widget.text,
                style: GoogleFonts.leagueSpartan(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (widget.icon != null &&
                  widget.iconPosition == AtomicIconPosition.right)
                const SizedBox(width: 8),
              if (widget.icon != null &&
                  widget.iconPosition == AtomicIconPosition.right)
                Icon(widget.icon, size: 18, color: textColor),
            ],
          ),
        ),
      ),
    );
  }
}
