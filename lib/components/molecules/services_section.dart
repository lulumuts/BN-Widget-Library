import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../atoms/service_button.dart';
import '../atoms/atomic_text.dart';

class ServicesSection extends StatefulWidget {
  final VoidCallback? onBookAppointment;
  final VoidCallback? onBookRemoval;
  final bool isAppointmentActive;
  final bool isRemovalActive;

  const ServicesSection({
    super.key,
    this.onBookAppointment,
    this.onBookRemoval,
    this.isAppointmentActive = true,
    this.isRemovalActive = false,
  });

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  late bool isAppointmentActive;
  late bool isRemovalActive;

  @override
  void initState() {
    super.initState();
    isAppointmentActive = widget.isAppointmentActive;
    isRemovalActive = widget.isRemovalActive;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 8),
          child: Text(
            'OUR SERVICES',
            style: GoogleFonts.leagueSpartan(
              color: const Color(0xFF332749),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          width: 700,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Expanded(
                child: ServiceButton(
                  text: "Book a New Look",
                  customIconBuilder: (isActive, iconColor) {
                    try {
                      return SizedBox(
                        width: 24,
                        height: 24,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/images/braids_vector.svg',
                            fit: BoxFit.contain,
                            colorFilter: ColorFilter.mode(
                              isActive ? const Color(0xFF332749) : Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      );
                    } catch (e) {
                      // Fallback to icon if SVG fails
                      return Icon(
                        Icons.face,
                        size: 24,
                        color:
                            isActive ? const Color(0xFF332749) : Colors.white,
                      );
                    }
                  },
                  isPrimary: true,
                  isActive: isAppointmentActive,
                  onPressed: () {
                    // Handle "Book a New Look" button click
                    setState(() {
                      isAppointmentActive = true;
                      isRemovalActive = false;
                    });
                    print('Book a New Look button clicked');
                    // You can add navigation or other functionality here
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ServiceButton(
                  text: "Book Braids Removal",
                  customIconBuilder: (isActive, iconColor) {
                    try {
                      return SizedBox(
                        width: 24,
                        height: 24,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/images/braids_removal.svg',
                            fit: BoxFit.contain,
                            colorFilter: ColorFilter.mode(
                              isActive ? const Color(0xFF332749) : Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      );
                    } catch (e) {
                      // Fallback to icon if SVG fails
                      return Icon(
                        Icons.close_rounded,
                        size: 24,
                        color:
                            isActive ? const Color(0xFF332749) : Colors.white,
                      );
                    }
                  },
                  isPrimary: false,
                  isActive: isRemovalActive,
                  onPressed: () {
                    // Handle "Book Braids Removal" button click
                    setState(() {
                      isAppointmentActive = false;
                      isRemovalActive = true;
                    });
                    print('Book Braids Removal button clicked');
                    // You can add navigation or other functionality here
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
