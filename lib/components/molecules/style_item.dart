import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final VoidCallback? onTap;
  final bool isActive;

  const StyleItem({
    super.key,
    required this.imageUrl,
    required this.name,
    this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 102,
            height: 102,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  isActive ? const Color(0xFF7F38FF) : const Color(0xFFF8F5FF),
              border: Border.all(
                color: isActive
                    ? const Color(0xFF7F38FF)
                    : const Color.fromARGB(255, 255, 255, 255),
                width: 2,
              ),
            ),
            child: ClipOval(
              child: isActive
                  ? Container(
                      width: 102,
                      height: 102,
                      decoration: const BoxDecoration(
                        color: Color(0xFF7F38FF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 32,
                      ),
                    )
                  : Image.asset(
                      imageUrl,
                      width: 102,
                      height: 102,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 102,
                        height: 102,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF8F5FF),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.image,
                          color: Color(0xFF7F38FF),
                          size: 32,
                        ),
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: GoogleFonts.leagueSpartan(
              color:
                  isActive ? const Color(0xFF7F38FF) : const Color(0xFF332749),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
