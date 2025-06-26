import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/service_data.dart';

class SalonItem extends StatelessWidget {
  final SalonData salon;
  final VoidCallback? onTap;

  const SalonItem({
    super.key,
    required this.salon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Color(0xFFF8F5FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF8F5FF),
                border: Border.all(
                  color: const Color(0xFFE0D5FF),
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  salon.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF8F5FF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.store,
                        color: Color(0xFF7F38FF),
                        size: 24,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    salon.name,
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF332749),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    salon.style,
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF665D76),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              salon.price,
              style: GoogleFonts.leagueSpartan(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF7F38FF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
