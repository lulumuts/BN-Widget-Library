import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../organisms/styles_grid.dart';
import '../models/service_data.dart';
import '../templates/home_template.dart';
import '../atoms/rating_stars.dart';

// Export the organism for use elsewhere
export 'braider_status_list_view.dart';

class RightContainer extends StatelessWidget {
  final List<StyleData> styles;
  final List<SalonData> salons;
  final int? selectedStyleIndex;
  final ValueChanged<int>? onStyleSelected;

  const RightContainer({
    super.key,
    required this.styles,
    required this.salons,
    this.selectedStyleIndex,
    this.onStyleSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Styles section
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SERVICES OFFERED',
              style: GoogleFonts.leagueSpartan(
                color: const Color(0xFF332749),
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.32,
              ),
            ),
            const SizedBox(height: 16),
            StylesGrid(
              styles: styles,
              selectedIndex: selectedStyleIndex,
              onStyleSelected: onStyleSelected,
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Popular salons section
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F6FC),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ListView.builder(
                    itemCount: salons.length,
                    itemBuilder: (context, index) => _DesktopSalonListItem(
                      salon: salons[index],
                    ),
                    physics: const AlwaysScrollableScrollPhysics(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DesktopSalonListItem extends StatelessWidget {
  final SalonData salon;

  const _DesktopSalonListItem({required this.salon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
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
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
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
                const SizedBox(height: 4),
                Text(
                  salon.style,
                  style: GoogleFonts.leagueSpartan(
                    color: const Color(0xFF332749),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  salon.price,
                  style: GoogleFonts.leagueSpartan(
                    color: const Color(0xFF332749),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                RatingStars(
                  filledStars: 5,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
