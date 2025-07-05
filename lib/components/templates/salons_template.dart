import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../atoms/custom_button.dart';
import '../atoms/atomic_text.dart';
import '../atoms/service_button.dart';
import '../organisms/styles_grid.dart';
import '../organisms/home_cards_template.dart';
import '../molecules/salon_item.dart';
import '../models/service_data.dart';
import '../molecules/services_section.dart';
import '../../screens/mobile_salon_screen.dart';
import 'dart:async';
import '../molecules/salon_card.dart';

class SalonsTemplate extends StatefulWidget {
  final int? selectedLeftOption;
  const SalonsTemplate({super.key, this.selectedLeftOption});

  @override
  State<SalonsTemplate> createState() => _SalonsTemplateState();
}

class _SalonsTemplateState extends State<SalonsTemplate> {
  int selectedLeftOptionInternal = 0;

  final List<Map<String, String>> leftOptions = [
    {
      'image': 'assets/images/BraidsBackground.png',
      'title': 'Braids',
    },
    {
      'image': 'assets/images/LinesBackground.png',
      'title': 'Lines',
    },
    {
      'image': 'assets/images/TwistsBackground.png',
      'title': 'Twists',
    },
    {
      'image': 'assets/images/LocsBackground.png',
      'title': 'Locs',
    },
    {
      'image': 'assets/images/WeavesBackground.png',
      'title': 'Weaves',
    },
    {
      'image': 'assets/images/MaintenanceBackground.png',
      'title': 'Natural',
    },
  ];

  int get effectiveSelectedLeftOption {
    final selected = widget.selectedLeftOption ?? selectedLeftOptionInternal;
    // Ensure the selected index is within bounds
    return selected.clamp(0, leftOptions.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Use screen width to determine if we should show mobile or desktop layout
          final screenWidth = MediaQuery.of(context).size.width;
          final isMobile = screenWidth < 768; // Mobile breakpoint

          if (isMobile) {
            return MobileSalonScreen(
                selectedLeftOption: effectiveSelectedLeftOption);
          } else {
            return Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
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
                              const SizedBox(height: 2),
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
        },
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildTopNavigationBar(),
          const SizedBox(height: 40),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Calculate left and right container heights
                  final left = _buildLeftPromoSection();
                  final leftKey = GlobalKey();
                  final leftWidget = Container(key: leftKey, child: left);
                  // Use the same height for both containers
                  return Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        left,
                        _buildResponsiveSpacing(),
                        // Right container matches left container's height
                        SizedBox(
                          height: (constraints.maxHeight),
                          child: _buildRightContentSection(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildMobileContent(context),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -1.2),
          radius: 1.0,
          colors: [
            Color(0xFF7F38FF),
            Color(0xFFCBAEFF),
            Color(0xFFDECCFF),
            Color(0xFFEEE4FF),
            Colors.white
          ],
          stops: [0.0, 0.25, 0.5, 0.75, 1.0],
        ),
      ),
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 59),
            child: Column(
              children: [
                _buildMobilePromoBanner(),
                const SizedBox(height: 21),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              border: Border(top: BorderSide(color: Color(0xFFEEE4FF))),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMobileServicesSection(),
                const SizedBox(height: 32),
                _buildMobileStylesSection(),
                const SizedBox(height: 32),
                _buildMobileSalonsSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobilePromoBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0x7FC6B3E8),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'New customers get',
                style: GoogleFonts.leagueSpartan(
                  color: const Color(0xFF332749),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: ' \n10% off ',
                style: GoogleFonts.leagueSpartan(
                  color: const Color(0xFF332749),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: 'for',
                style: GoogleFonts.leagueSpartan(
                  color: const Color(0xFF332749),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: ' Knotless Braids!',
                style: GoogleFonts.leagueSpartan(
                  color: const Color(0xFF332749),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileServicesSection() {
    return const ServicesSection(
      isAppointmentActive: true,
      isRemovalActive: false,
    );
  }

  Widget _buildMobileStylesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'OUR STYLES',
            style: GoogleFonts.leagueSpartan(
              color: const Color(0xFF332749),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.32,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            children: [
              _buildMobileStyleItem(
                  "assets/images/Braids-button.png", "Braids"),
              const SizedBox(width: 20),
              _buildMobileStyleItem("assets/images/Locs-button.png", "Locs"),
              const SizedBox(width: 20),
              _buildMobileStyleItem(
                  "assets/images/Twists-button.png", "Twists"),
              const SizedBox(width: 20),
              _buildMobileStyleItem("assets/images/Lines-button.png", "Lines"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileStyleItem(String imageUrl, String name) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            imageUrl,
            width: 78,
            height: 78,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 78,
              height: 78,
              color: Colors.grey[200],
              child: Icon(Icons.error, color: Colors.grey[400]),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: GoogleFonts.leagueSpartan(
            color: const Color(0xFF332749),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildMobileSalonsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SELECT A SALON BELOW',
            style: GoogleFonts.leagueSpartan(
              color: const Color(0xFF332749),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.32,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F6FC),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: _buildMobileSalonListItems(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildMobileSalonListItems() {
    // Create mobile salon list items based on the left options
    return leftOptions.asMap().entries.map((entry) {
      final index = entry.key;
      final option = entry.value;
      return _buildMobileSalonListItem(
        option['image']!,
        option['title']!,
        'Stall ${index + 1}',
        '${1000 + (index * 500)} KES',
      );
    }).toList();
  }

  Widget _buildMobileSalonListItem(
      String imageUrl, String name, String style, String price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SalonCard(
        salonName: name,
        imageUrl: imageUrl,
        // Optionally, you can pass onReadStory/onBookNow callbacks here
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 2, // 'Salons' is the selected item
      onTap: (index) {
        // TODO: Handle navigation
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF7F38FF),
      unselectedItemColor: const Color(0xBF332749),
      selectedLabelStyle: GoogleFonts.leagueSpartan(
          fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 0.48),
      unselectedLabelStyle: GoogleFonts.leagueSpartan(
          fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.48),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined), label: "Salons"),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline), label: "Chat"),
        BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined), label: "Orders"),
      ],
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
            SizedBox(
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
            const _NavItem(text: "Home", isSelected: true),
            const SizedBox(width: 40),
            const _NavItem(text: "Salons"),
            const SizedBox(width: 40),
            const _NavItem(text: "Chat"),
            const SizedBox(width: 40),
            const _NavItem(text: "Orders"),
            const SizedBox(width: 40),
            const _NavItem(text: "Lulu"),
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

  Widget _buildLeftPromoSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        double containerWidth;
        double containerHeight;

        // Calculate width based on screen width
        if (screenWidth > 1800) {
          containerWidth = screenWidth * 0.3; // 25% of screen width
        } else if (screenWidth > 1400) {
          containerWidth = screenWidth * 0.3; // 30% of screen width
        } else if (screenWidth > 1200) {
          containerWidth = screenWidth * 0.35; // 35% of screen width
        } else if (screenWidth > 1000) {
          containerWidth = screenWidth * 0.4; // 40% of screen width
        } else {
          containerWidth = screenWidth * 0.45; // 45% of screen width
        }

        // Calculate height based on screen height with better responsiveness
        if (screenHeight > 1200) {
          containerHeight = screenHeight * 0.7; // 70% for very large screens
        } else if (screenHeight > 1000) {
          containerHeight = screenHeight * 0.8; // 75% for large screens
        } else if (screenHeight > 800) {
          containerHeight = screenHeight * 0.8; // 80% for medium screens
        } else if (screenHeight > 600) {
          containerHeight = screenHeight * 0.8; // 85% for smaller screens
        } else {
          containerHeight = screenHeight * 0.9; // 90% for very small screens
        }

        // Ensure minimum and maximum sizes with better constraints
        containerWidth = containerWidth.clamp(300.0, 800.0);
        containerHeight = containerHeight.clamp(500.0, 900.0);

        return Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            color: const Color(0xFFF7F2FF),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: const Color(0xFF7F38FF),
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                // Static background image positioned at bottom
                Positioned(
                  bottom: 0, // Position at bottom of container
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SizedBox(
                      width: constraints.maxWidth * 0.3,
                      child: Image.asset(
                        leftOptions[effectiveSelectedLeftOption]['image']!,
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                // Centered title at 25% from the top
                Positioned(
                  top: constraints.maxHeight * 0.25, // 25% of container height
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      leftOptions[effectiveSelectedLeftOption]['title']!,
                      style: GoogleFonts.leagueSpartan(
                        color: const Color(0xFF7F38FF),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildResponsiveSpacing() {
    return const SizedBox(width: 20);
  }

  // Builds the right services section
  Widget _buildRightSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        double containerWidth;
        double containerHeight;

        // Calculate width based on screen width
        if (screenWidth > 1800) {
          containerWidth = screenWidth * 0.35; // 35% of screen width
        } else if (screenWidth > 1400) {
          containerWidth = screenWidth * 0.4; // 40% of screen width
        } else if (screenWidth > 1200) {
          containerWidth = screenWidth * 0.45; // 45% of screen width
        } else if (screenWidth > 1000) {
          containerWidth = screenWidth * 0.5; // 50% of screen width
        } else {
          containerWidth = screenWidth * 0.55; // 55% of screen width
        }

        // Calculate height based on screen height
        if (screenHeight > 1000) {
          containerHeight =
              screenHeight * 0.1; // 15% of screen height for services
        } else if (screenHeight > 750) {
          containerHeight =
              screenHeight * 0.1; // 18% of screen height for services
        } else {
          containerHeight =
              screenHeight * 0.1; // 20% of screen height for services
        }

        // Ensure minimum and maximum sizes
        containerWidth = containerWidth.clamp(350.0, 800.0);
        containerHeight = containerHeight.clamp(80.0, 150.0);

        return SizedBox(
          width: containerWidth,
          height: containerHeight,
          child: _buildServicesSection(),
        );
      },
    );
  }

  // Builds the "Our Services" section with two action buttons.
  Widget _buildServicesSection() {
    return const ServicesSection(
      isAppointmentActive: true, // Default to "Book a New Look" active
      isRemovalActive: false,
    );
  }

  Widget _buildRightContentSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        double containerWidth;
        double containerHeight;
        EdgeInsets padding;

        // Calculate width based on screen width
        if (screenWidth > 1800) {
          containerWidth = screenWidth * 0.35; // 35% of screen width
          padding = const EdgeInsets.symmetric(horizontal: 56, vertical: 40);
        } else if (screenWidth > 1400) {
          containerWidth = screenWidth * 0.4; // 40% of screen width
          padding = const EdgeInsets.symmetric(horizontal: 48, vertical: 36);
        } else if (screenWidth > 1200) {
          containerWidth = screenWidth * 0.45; // 45% of screen width
          padding = const EdgeInsets.symmetric(horizontal: 40, vertical: 32);
        } else if (screenWidth > 1000) {
          containerWidth = screenWidth * 0.5; // 50% of screen width
          padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 28);
        } else {
          containerWidth = screenWidth * 0.55; // 55% of screen width
          padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 24);
        }

        // Calculate height based on screen height with better responsiveness
        if (screenHeight > 1200) {
          containerHeight = screenHeight * 0.7; // 70% for very large screens
        } else if (screenHeight > 1000) {
          containerHeight = screenHeight * 0.7; // 75% for large screens
        } else if (screenHeight > 800) {
          containerHeight = screenHeight * 0.7; // 80% for medium screens
        } else if (screenHeight > 600) {
          containerHeight = screenHeight * 0.7; // 85% for smaller screens
        } else {
          containerHeight = screenHeight * 0.7; // 90% for very small screens
        }

        // Ensure minimum and maximum sizes with better constraints
        containerWidth = containerWidth.clamp(350.0, 800.0);
        containerHeight = containerHeight.clamp(
            400.0, 1000.0); // Adjusted range for better responsiveness

        return Container(
          width: containerWidth,
          height: containerHeight,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SELECT A SALON BELOW',
                style: GoogleFonts.leagueSpartan(
                  color: const Color(0xFF332749),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.32,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Scrollbar(
                  child: GridView.builder(
                    itemCount: 12, // 12 cards total for better scrolling
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 24,
                      childAspectRatio:
                          1.2, // width/height ratio (increased height by 60% from original)
                    ),
                    itemBuilder: (context, index) {
                      final cardImages = [
                        'assets/images/Weekly_Feature.png',
                        'assets/images/Beyond_the_chair.png',
                        'assets/images/Profile_notification.png',
                        'assets/images/Weekly_Feature.png',
                        'assets/images/Beyond_the_chair.png',
                        'assets/images/Profile_notification.png',
                        'assets/images/Weekly_Feature.png',
                        'assets/images/Beyond_the_chair.png',
                        'assets/images/Profile_notification.png',
                        'assets/images/Weekly_Feature.png',
                        'assets/images/Beyond_the_chair.png',
                        'assets/images/Profile_notification.png',
                      ];
                      return SalonCard(
                        salonName: 'Salon ${index + 1}',
                        imageUrl: cardImages[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
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

// Image card widget for the grid
class _ImageCard extends StatelessWidget {
  final String imagePath;
  const _ImageCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 180,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.2),
              height: 180,
            ),
          ),
        ],
      ),
    );
  }
}
