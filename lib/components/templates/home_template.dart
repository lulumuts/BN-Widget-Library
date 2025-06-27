import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../atoms/custom_button.dart';
import '../atoms/atomic_text.dart';
import '../atoms/service_button.dart';
import '../organisms/styles_grid.dart';
import '../molecules/salon_item.dart';
import '../models/service_data.dart';
import '../molecules/services_section.dart';

class HomeTemplate extends StatefulWidget {
  final List<StyleData> styles;
  final List<ServiceButtonData> services;
  final List<SalonData> salons;
  final VoidCallback? onBookAppointment;
  final String? currentUrl; // For future URL-based content switching

  const HomeTemplate({
    super.key,
    required this.styles,
    required this.services,
    required this.salons,
    this.onBookAppointment,
    this.currentUrl,
  });

  @override
  State<HomeTemplate> createState() => _HomeTemplateState();
}

class _HomeTemplateState extends State<HomeTemplate> {
  int? selectedStyleIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildTopNavigationBar(),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLeftPromoSection(),
                  _buildResponsiveSpacing(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildRightSection(),
                      const SizedBox(height: 4),
                      _buildRightContentSection(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Builds the top navigation bar
  Widget _buildTopNavigationBar() {
    return Container(
      height: 72,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 3,
            color: Color(0x077F38FF),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            // Logo placeholder
            Container(
              width: 59.80,
              height: 65.17,
              // color: const Color(0xFF7F38FF),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/BN_LOGO.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Spacer(),
            // Navigation items
            _NavItem(text: "Home", isSelected: true),
            const SizedBox(width: 40),
            _NavItem(text: "Salons"),
            const SizedBox(width: 40),
            _NavItem(text: "Chat"),
            const SizedBox(width: 40),
            _NavItem(text: "Orders"),
            const SizedBox(width: 40),
            _NavItem(text: "Lulu"),
            const SizedBox(width: 20),
            // Profile avatar
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 2,
                ),
              ),
            ),
            const SizedBox(width: 20),
            // Close button
            _CloseButton(),
          ],
        ),
      ),
    );
  }

  // Builds the left promotional section
  Widget _buildLeftPromoSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        double containerWidth;
        double containerHeight;

        if (screenWidth > 1800) {
          containerWidth = 800;
          containerHeight = 750;
        } else if (screenWidth > 1400) {
          containerWidth = 600;
          containerHeight = 750;
        } else if (screenWidth > 1200) {
          containerWidth = 500;
          containerHeight = 700;
        } else if (screenWidth > 1000) {
          containerWidth = 400;
          containerHeight = 650;
        } else {
          containerWidth = 350;
          containerHeight = 650;
        }

        return Container(
          width: containerWidth,
          height: containerHeight, // Use same responsive height as right side
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0x267F38FF),
                blurRadius: 23,
                offset: Offset(0, 4),
                spreadRadius: 6,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                // Background image
                Positioned.fill(
                  child: Image.network(
                    "https://placehold.co/622x944",
                    fit: BoxFit.cover,
                  ),
                ),
                // Gradient overlay
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 427,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.50, -0.20),
                        end: Alignment(0.50, 1.00),
                        colors: [
                          Color(0x00F5F5F5),
                          Color(0x00D1C9E0),
                          Color(0x6FA390C5),
                          Color(0xCB603D9E),
                          Color(0xFF3A0F88)
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                  ),
                ),
                // Text content
                Positioned(
                  bottom: 200,
                  left: 47,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Get',
                              style: GoogleFonts.leagueSpartan(
                                color: const Color(0xFF332749),
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' 10% ',
                              style: GoogleFonts.leagueSpartan(
                                color: const Color(0xFF332749),
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: 'off your next',
                              style: GoogleFonts.leagueSpartan(
                                color: const Color(0xFF332749),
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' \nKnotless Braids\n ',
                              style: GoogleFonts.leagueSpartan(
                                color: const Color(0xFF332749),
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Book before 12 of June 2025 to\nredeem offer!',
                        style: GoogleFonts.leagueSpartan(
                          color: const Color(0xFF332749),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            decoration: const BoxDecoration(
                              color: Color(0xFF7F38FF),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 17),
                          Container(
                            width: 18,
                            height: 18,
                            decoration: const BoxDecoration(
                              color: Color(0xFFC4BAD7),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 17),
                          Container(
                            width: 18,
                            height: 18,
                            decoration: const BoxDecoration(
                              color: Color(0xFFC4BAD7),
                              shape: BoxShape.circle,
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
      },
    );
  }

  // Builds the right services section
  Widget _buildRightSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        double containerWidth;
        double containerHeight;

        if (screenWidth > 1800) {
          containerWidth = 730;
          containerHeight = 700;
        } else if (screenWidth > 1400) {
          containerWidth = 700;
          containerHeight = 700;
        } else if (screenWidth > 1200) {
          containerWidth = 600;
          containerHeight = 600;
        } else if (screenWidth > 1000) {
          containerWidth = 600;
          containerHeight = 550;
        } else {
          containerWidth = 400;
          containerHeight = 550;
        }

        return Container(
          width: containerWidth,
          height: 96,
          child: _buildServicesSection(),
        );
      },
    );
  }

  // Builds the right content section
  Widget _buildRightContentSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        double containerWidth;
        double containerHeight;
        EdgeInsets padding;

        if (screenWidth > 1800) {
          containerWidth = 700;
          containerHeight = 730;
          padding = const EdgeInsets.symmetric(horizontal: 56, vertical: 40);
        } else if (screenWidth > 1400) {
          containerWidth = 700;
          containerHeight = 730;
          padding = const EdgeInsets.symmetric(horizontal: 48, vertical: 36);
        } else if (screenWidth > 1200) {
          containerWidth = 600;
          containerHeight = 600;
          padding = const EdgeInsets.symmetric(horizontal: 40, vertical: 32);
        } else if (screenWidth > 1000) {
          containerWidth = 600;
          containerHeight = 550;
          padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 28);
        } else {
          containerWidth = 400;
          containerHeight = 550;
          padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 24);
        }

        return Container(
          width: containerWidth,
          height: containerHeight, // Use 80% of available height
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: const Color(0xFFEEE4FF),
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x267F38FF),
                blurRadius: 23,
                offset: Offset(0, 4),
                spreadRadius: 6,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStylesSection(),
                const SizedBox(height: 24),
                Expanded(
                  child: _buildPopularSalonsSection(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Builds the "Our Services" section with two action buttons.
  Widget _buildServicesSection() {
    return ServicesSection(
      isAppointmentActive: true, // Default to "Book a New Look" active
      isRemovalActive: false,
    );
  }

  // Builds the "Our Styles" section
  Widget _buildStylesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'OUR STYLES',
          style: GoogleFonts.leagueSpartan(
            color: const Color(0xFF332749),
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.32,
          ),
        ),
        const SizedBox(height: 16),
        StylesGrid(
          styles: widget.styles,
          selectedIndex: selectedStyleIndex,
          onStyleSelected: (index) {
            setState(() {
              selectedStyleIndex = index;
            });
          },
        ),
      ],
    );
  }

  // Builds the "Popular Salons" section
  Widget _buildPopularSalonsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'POPULAR SALONS',
          style: GoogleFonts.leagueSpartan(
            color: const Color(0xFF332749),
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.32,
          ),
        ),
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
              itemCount: widget.salons.length,
              itemBuilder: (context, index) => _DesktopSalonListItem(
                salon: widget.salons[index],
              ),
              physics: const AlwaysScrollableScrollPhysics(),
            ),
          ),
        ),
      ],
    );
  }

  // Builds the responsive spacing between left and right sections
  Widget _buildResponsiveSpacing() {
    return const SizedBox(width: 40);
  }
}

// Navigation item widget
class _NavItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const _NavItem({required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.leagueSpartan(
        color: isSelected ? const Color(0xFF7F38FF) : const Color(0xBF332749),
        fontSize: 16,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        letterSpacing: 0.80,
      ),
    );
  }
}

// Close button widget
class _CloseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/chevron-down.svg',
      width: 24,
      height: 24,
      colorFilter: const ColorFilter.mode(
        Color(0xFF7F38FF),
        BlendMode.srcIn,
      ),
    );
  }
}

// Desktop salon list item widget
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
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F5FF),
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
                  salon.name,
                  style: GoogleFonts.leagueSpartan(
                    color: const Color(0xFF332749),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
