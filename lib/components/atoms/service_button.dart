import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceButton extends StatelessWidget {
  final String text;
  final String? imageUrl;
  final IconData? iconData;
  final Widget? customIcon;
  final Widget Function(bool isActive, Color iconColor)? customIconBuilder;
  final bool isPrimary;
  final bool isActive;
  final VoidCallback? onPressed;

  const ServiceButton({
    super.key,
    required this.text,
    this.imageUrl,
    this.iconData,
    this.customIcon,
    this.customIconBuilder,
    this.isPrimary = true,
    this.isActive = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final color = isPrimary ? Colors.white : const Color(0xFF332749);
    final bgColor = isActive
        ? const Color(0xFF332749)
        : (isPrimary ? Colors.transparent : Colors.transparent);
    final borderColor = isActive
        ? const Color(0xFF332749)
        : (isPrimary ? const Color(0xFF332749) : const Color(0xFF332749));

    final iconColor = isActive
        ? Colors.white
        : (isPrimary ? Colors.white : const Color(0xFF332749));

    // Text color should match border color when active
    final textColor = isActive ? Colors.white : const Color(0xFF332749);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Stack(
          children: [
            // Centered text
            Center(
              child: Text(
                text,
                style: GoogleFonts.leagueSpartan(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Left positioned icon
            Positioned(
              left: 8,
              top: 0,
              bottom: 0,
              child: Center(
                child: Row(
                  children: [
                    if (customIconBuilder != null)
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive ? Colors.white : borderColor,
                        ),
                        child: Center(
                          child: customIconBuilder!(isActive, iconColor),
                        ),
                      ),
                    if (customIcon != null && customIconBuilder == null)
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive ? Colors.white : borderColor,
                        ),
                        child: Center(
                          child: customIcon!,
                        ),
                      ),
                    if (imageUrl != null &&
                        customIcon == null &&
                        customIconBuilder == null)
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive ? Colors.white : borderColor,
                        ),
                        child: Center(
                          child: _buildImage(),
                        ),
                      ),
                    if (iconData != null &&
                        customIcon == null &&
                        customIconBuilder == null &&
                        imageUrl == null)
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive ? Colors.white : borderColor,
                        ),
                        child: Center(
                          child: Icon(
                            iconData,
                            size: 18,
                            color: iconColor,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (imageUrl == null) return const SizedBox.shrink();

    // Check if it's a local asset (starts with 'assets/')
    if (imageUrl!.startsWith('assets/')) {
      // Check if it's an SVG file
      if (imageUrl!.toLowerCase().endsWith('.svg')) {
        return SvgPicture.asset(
          imageUrl!,
          width: 19,
          height: 19,
          colorFilter: ColorFilter.mode(
            isActive ? const Color(0xFF7F38FF) : Colors.white,
            BlendMode.srcIn,
          ),
        );
      } else {
        // It's a regular image asset
        return Image.asset(
          imageUrl!,
          width: 19,
          height: 19,
        );
      }
    } else {
      // It's a network image
      return Image.network(
        imageUrl!,
        width: 19,
        height: 19,
      );
    }
  }
}
