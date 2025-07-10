import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../atoms/rating_stars.dart';

class SalonCard extends StatelessWidget {
  final String salonName;
  final String? imageUrl;
  final VoidCallback? onReadStory;
  final VoidCallback? onBookNow;

  const SalonCard({
    super.key,
    required this.salonName,
    this.imageUrl,
    this.onReadStory,
    this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: const Color(0x99332749),
          image: imageUrl != null
              ? DecorationImage(
                  image: AssetImage(imageUrl!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Stack(
          children: [
            // Overlay with 60% opacity
            if (imageUrl != null)
              Positioned.fill(
                child: ColoredBox(
                  color: const Color(0xFF332749).withOpacity(0.6),
                ),
              ),
            // Rating stars in the top-right corner
            Positioned(
              top: 12,
              right: 12,
              child: RatingStars(
                filledStars: 3,
                size: 20,
                starColor: Colors.white,
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  // Salon name
                  Text(
                    salonName,
                    style: GoogleFonts.leagueSpartan(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Buttons row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Read Her Story button
                      Expanded(
                        child: GestureDetector(
                          onTap: onReadStory,
                          child: Container(
                            margin: const EdgeInsets.only(right: 4),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: Text(
                              'Read Her Story',
                              style: GoogleFonts.leagueSpartan(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(0, 2),
                                    blurRadius: 4,
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.25),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      // Book Now button
                      Expanded(
                        child: GestureDetector(
                          onTap: onBookNow,
                          child: Container(
                            margin: const EdgeInsets.only(left: 4),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: Text(
                              'Book Now',
                              style: GoogleFonts.leagueSpartan(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(0, 2),
                                    blurRadius: 4,
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.25),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
