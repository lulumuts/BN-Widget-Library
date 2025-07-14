import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/molecules/salon_item.dart';
import '../components/models/service_data.dart';
import '../components/molecules/services_section.dart';
import '../../screens/mobile_braider_screen.dart';
import 'dart:async';
import '../components/molecules/salon_card.dart';
import '../components/templates/home_template.dart';
import '../components/atoms/rating_stars.dart';
import '../components/organisms/styles_grid.dart';
import '../components/organisms/right_container.dart';
import '../components/atoms/service_button.dart';
import '../components/molecules/style_item.dart';
import '../components/atoms/bottom_nav_icon_button.dart';
import '../components/organisms/navbar.dart';

class BraiderTemplate extends StatefulWidget {
  final int? selectedLeftOption;
  final String? rightContentOption;
  const BraiderTemplate(
      {super.key, this.selectedLeftOption, this.rightContentOption});

  @override
  State<BraiderTemplate> createState() => _BraiderTemplateState();
}

class _BraiderTemplateState extends State<BraiderTemplate> {
  int selectedLeftOptionInternal = 0;

  // Internal state for right content, used if widget.rightContentOption is null
  String rightContentOptionInternal = 'Styles & Salons';
  final List<String> rightContentOptions = [
    'Styles & Salons',
    'Detailed Style View',
  ];

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
      'image': 'assets/images/NaturalBackground.png',
      'title': 'Natural',
    },
  ];

  int get effectiveSelectedLeftOption {
    final selected = widget.selectedLeftOption ?? selectedLeftOptionInternal;
    // Ensure the selected index is within bounds
    return selected.clamp(0, leftOptions.length - 1);
  }

  // Add styles, services, and salons lists as in DesktopHomePage/HomeTemplate
  final List<ServiceButtonData> _services = [
    const ServiceButtonData(
      text: "Book a New Look",
      imageUrl: "assets/images/braids_vector.svg",
      isPrimary: true,
    ),
    const ServiceButtonData(
      text: "Book Braids Removal",
      isPrimary: false,
      iconData: Icons.close_rounded,
    ),
  ];

  final List<StyleData> _styles = [
    const StyleData(
      imageUrl: "assets/images/Braids-button.png",
      name: "Braids",
    ),
    const StyleData(
      imageUrl: "assets/images/Locs-button.png",
      name: "Locs",
    ),
    const StyleData(
      imageUrl: "assets/images/Twists-button.png",
      name: "Twists",
    ),
    const StyleData(
      imageUrl: "assets/images/Lines-button.png",
      name: "Lines",
    ),
    const StyleData(
      imageUrl: "assets/images/Weaves-button.png",
      name: "Weaves",
    ),
    const StyleData(
      imageUrl: "assets/images/Natural-button.png",
      name: "Natural",
    ),
  ];

  final List<SalonData> _salons = [
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Doris' Salon - Stall 222",
      style: "Bob Braids",
      price: "1500 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Linet's Salon - Stall 10",
      style: "Twist Braids",
      price: "2300 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Maggy's Salon - Stall 321",
      style: "Box Braids",
      price: "2000 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Connie's Salon - Stall 55",
      style: "Bob Braids",
      price: "1500 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Sarah's Salon - Stall 123",
      style: "Cornrow Braids",
      price: "1800 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Grace's Salon - Stall 456",
      style: "Fulani Braids",
      price: "2500 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Mary's Salon - Stall 789",
      style: "Ghana Braids",
      price: "2200 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Jane's Salon - Stall 101",
      style: "Senegalese Twists",
      price: "2800 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Ann's Salon - Stall 202",
      style: "Micro Braids",
      price: "3200 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Rose's Salon - Stall 303",
      style: "Knotless Braids",
      price: "3500 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Faith's Salon - Stall 404",
      style: "Passion Twists",
      price: "2400 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Hope's Salon - Stall 505",
      style: "Box Braids",
      price: "2100 KES",
    ),
  ];

  int? selectedStyleIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Use screen width to determine if we should show mobile or desktop layout
          final screenWidth = MediaQuery.of(context).size.width;
          final isMobile = screenWidth < 768; // Mobile breakpoint

          if (isMobile) {
            return MobileBraiderPreview();
          } else {
            return Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const Navbar(activeTab: 'Salons'),
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
          child: Stack(
            children: [
              // Gradient as background, fills the whole area
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0.0, 0.25), // Move gradient up slightly
                      radius: 0.7,
                      colors: [
                        const Color(0xFF7F38FF),
                        const Color(0xFFCBAEFF),
                        const Color(0xFFDECCFF),
                        const Color(0x11EEE4FF)
                      ],
                    ),
                  ),
                ),
              ),
              // Card and image (centered content)
              Center(
                child: SizedBox(
                  width: containerWidth,
                  height: 705.06,
                  child: Stack(
                    children: [
                      // Profile image container - centered and sized for responsive container
                      Positioned(
                        left: (containerWidth - 400) /
                            2, // Center within responsive container
                        top: 151, // Moved down by 60px
                        child: Container(
                          width: 400,
                          height: 336, // Original height
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Doris-Image.png'),
                              fit: BoxFit.cover,
                              alignment: Alignment(0, -1),
                            ),
                          ),
                        ),
                      ),
                      // Overlay container - centered and sized for responsive container
                      Positioned(
                        left: ((containerWidth > 600
                                ? containerWidth - 500
                                : containerWidth - 400) /
                            2), // Center based on width
                        top: 448, // Move card up by 40px
                        child: Container(
                          width: containerWidth > 600
                              ? 500
                              : 400, // Wider card for large screens
                          height: 184,
                          decoration: ShapeDecoration(
                            color: const Color(0x267F38FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                              ),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x1C7F38FF),
                                blurRadius: 18,
                                offset: Offset(0, 4),
                                spreadRadius: 3,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(32, 56, 24, 32),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Doris\' Salon - Stall 222',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.leagueSpartan(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      height: 0.56,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '5 km away | 500 KES transport fee | 20 minutes',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.leagueSpartan(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      height: 1.33,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Stars and reviews OUTSIDE the card, at the top right of the whole left container
              Positioned(
                top: 24,
                right: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RatingStars(
                      filledStars: 4,
                      size: 24,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '87+ Reviews',
                      style: GoogleFonts.leagueSpartan(
                        color: Color(0xFF7F38FF),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              // Secondary button at the very bottom right of the left container
              Positioned(
                bottom: 16,
                right: 16,
                child: _HoverFillButton(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildResponsiveSpacing() {
    return const SizedBox(width: 20);
  }

  // Replace _buildRightSection with HomeTemplate's version
  Widget _buildRightSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        double containerWidth;
        double containerHeight;

        if (screenWidth > 1800) {
          containerWidth = screenWidth * 0.35;
        } else if (screenWidth > 1400) {
          containerWidth = screenWidth * 0.4;
        } else if (screenWidth > 1200) {
          containerWidth = screenWidth * 0.45;
        } else if (screenWidth > 1000) {
          containerWidth = screenWidth * 0.5;
        } else {
          containerWidth = screenWidth * 0.55;
        }

        if (screenHeight > 1000) {
          containerHeight = screenHeight * 0.1;
        } else if (screenHeight > 750) {
          containerHeight = screenHeight * 0.1;
        } else {
          containerHeight = screenHeight * 0.1;
        }

        containerWidth = containerWidth.clamp(350.0, 800.0);
        containerHeight = containerHeight.clamp(80.0, 150.0);

        return SizedBox(
          width: containerWidth,
          height: containerHeight,
          child: ServicesSection(
            isAppointmentActive: true,
            isRemovalActive: false,
          ),
        );
      },
    );
  }

  // Replace _buildRightContentSection with HomeTemplate's version
  Widget _buildRightContentSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        double containerWidth;
        double containerHeight;
        EdgeInsets padding;

        if (screenWidth > 1800) {
          containerWidth = screenWidth * 0.35;
          padding = const EdgeInsets.symmetric(horizontal: 56, vertical: 40);
        } else if (screenWidth > 1400) {
          containerWidth = screenWidth * 0.4;
          padding = const EdgeInsets.symmetric(horizontal: 48, vertical: 36);
        } else if (screenWidth > 1200) {
          containerWidth = screenWidth * 0.45;
          padding = const EdgeInsets.symmetric(horizontal: 40, vertical: 32);
        } else if (screenWidth > 1000) {
          containerWidth = screenWidth * 0.5;
          padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 28);
        } else {
          containerWidth = screenWidth * 0.55;
          padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 24);
        }

        if (screenHeight > 1200) {
          containerHeight = screenHeight * 0.7;
        } else if (screenHeight > 1000) {
          containerHeight = screenHeight * 0.7;
        } else if (screenHeight > 800) {
          containerHeight = screenHeight * 0.7;
        } else if (screenHeight > 600) {
          containerHeight = screenHeight * 0.7;
        } else {
          containerHeight = screenHeight * 0.7;
        }

        containerWidth = containerWidth.clamp(350.0, 800.0);
        containerHeight = containerHeight.clamp(400.0, 1000.0);

        // Use widget.rightContentOption if provided, otherwise internal state
        final selectedOption =
            widget.rightContentOption ?? rightContentOptionInternal;
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
          child: selectedOption == 'Detailed Style View'
              ? const DetailedStyleView()
              : RightContainer(
                  styles: _styles,
                  salons: _salons,
                  selectedStyleIndex: selectedStyleIndex,
                  onStyleSelected: (index) {
                    setState(() {
                      selectedStyleIndex = index;
                    });
                  },
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

  const _NavItem({
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle navigation item tap
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF7F38FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: GoogleFonts.leagueSpartan(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF332749),
          ),
        ),
      ),
    );
  }
}

// Close button widget
class _CloseButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _CloseButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: const Color(0xFF7F38FF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.close,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }
}

class BraiderScreenDesktop extends StatelessWidget {
  const BraiderScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Use mobile view for screens narrower than 1200px (changed from 600px)
          if (constraints.maxWidth < 1200) {
            print(
                'DEBUG: Using MobileBraiderPreview, width: ${constraints.maxWidth}');
            return const MobileBraiderPreview();
          }
          print('DEBUG: Using BraiderTemplate, width: ${constraints.maxWidth}');
          return const BraiderTemplate();
        },
      ),
    );
  }
}

class MobileBraiderPreview extends StatefulWidget {
  const MobileBraiderPreview({super.key});

  @override
  State<MobileBraiderPreview> createState() => _MobileBraiderPreviewState();
}

class _MobileBraiderPreviewState extends State<MobileBraiderPreview> {
  int selectedLeftOption = 0;
  String selectedRightContent = 'Styles & Salons';

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
      'image': 'assets/images/NaturalBackground.png',
      'title': 'Natural',
    },
  ];

  final List<StyleData> _styles = [
    const StyleData(
      imageUrl: "assets/images/Braids-button.png",
      name: "Braids",
    ),
    const StyleData(
      imageUrl: "assets/images/Locs-button.png",
      name: "Locs",
    ),
    const StyleData(
      imageUrl: "assets/images/Twists-button.png",
      name: "Twists",
    ),
    const StyleData(
      imageUrl: "assets/images/Lines-button.png",
      name: "Lines",
    ),
    const StyleData(
      imageUrl: "assets/images/Weaves-button.png",
      name: "Weaves",
    ),
    const StyleData(
      imageUrl: "assets/images/Natural-button.png",
      name: "Natural",
    ),
  ];

  final List<SalonData> _salons = [
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Doris' Salon - Stall 222",
      style: "Bob Braids",
      price: "1500 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Linet's Salon - Stall 10",
      style: "Twist Braids",
      price: "2300 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Maggy's Salon - Stall 321",
      style: "Box Braids",
      price: "2000 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Connie's Salon - Stall 55",
      style: "Bob Braids",
      price: "1500 KES",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildContent(context),
          // Back button at top left
          Positioned(
            top: 100,
            left: 16,
            child: SafeArea(
              child: IconButton(
                icon: Icon(Icons.chevron_left, size: 32, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
                tooltip: 'Back',
                splashRadius: 24,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // Builds the background image (Doris's image)
  Widget _buildBackground() {
    return Transform.translate(
      offset: const Offset(0, -380), // Move image up by 380 pixels
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/Doris-Image.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  // Builds the title overlay positioned on top of the background image
  Widget _buildTitleOverlay() {
    return Positioned(
      top: 100, // Position in the middle of the space
      left: 0,
      right: 0,
      child: Center(
        child: Column(
          children: [
            Text(
              'Doris\' Salon - Stall 222',
              style: GoogleFonts.leagueSpartan(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
                shadows: [
                  Shadow(
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              '5 km | 500 KES transport fee | 20 minutes',
              style: GoogleFonts.leagueSpartan(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                shadows: [
                  Shadow(
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              '87+ Reviews',
              style: GoogleFonts.leagueSpartan(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                shadows: [
                  Shadow(
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Builds the main content of the page.
  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 200),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              border: Border(top: BorderSide(color: Color(0xFFEEE4FF))),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Salon name, stars, and reviews
                  Text(
                    "Doris' Salon - Stall 222",
                    style: TextStyle(
                      color: Color(0xFF332749),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '5 km | 500 KES transport fee | 20 minutes',
                    style: TextStyle(
                      color: Color(0xFF332749),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      RatingStars(
                          filledStars: 4,
                          size: 24,
                          starColor: Color(0xFFFFC107)),
                      const SizedBox(width: 8),
                      Text(
                        '87+ Reviews',
                        style: TextStyle(
                          color: Color(0xFF332749),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // SERVICES OFFERED section
                  Text(
                    'SERVICES OFFERED',
                    style: TextStyle(
                      color: Color(0xFF332749),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Styles grid
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _styles.asMap().entries.map((entry) {
                        final index = entry.key;
                        final style = entry.value;
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: StyleItem(
                            imageUrl: style.imageUrl,
                            name: style.name,
                            isActive: false,
                            onTap: () {},
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Salons list
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    height: 380,
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F6FC),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: _salons
                            .map((salon) => Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFFF8F5FF),
                                          border: Border.all(
                                            color: Color(0xFFE0D5FF),
                                            width: 2,
                                          ),
                                        ),
                                        child: ClipOval(
                                          child: Image.asset(
                                            salon.imageUrl,
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF8F5FF),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 4),
                                            Text(
                                              salon.style,
                                              style: TextStyle(
                                                color: Color(0xFF332749),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              salon.price,
                                              style: TextStyle(
                                                color: Color(0xFF332749),
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
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServicesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OUR SERVICES',
            style: GoogleFonts.leagueSpartan(
              color: const Color(0xFF332749),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
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
                                isActive
                                    ? const Color(0xFF332749)
                                    : Colors.white,
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
                    isActive: false,
                    onPressed: () {
                      // Handle "Book Braids Removal" button click
                      print('Book Braids Removal button clicked');
                    },
                  ),
                ),
              ],
            ),
          ),
          // Debug text to see if content is rendering
          const SizedBox(height: 20),
          Text(
            '🚨 UPDATED: Mobile Braider Screen is working! 🚨',
            style: GoogleFonts.leagueSpartan(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'This text should be visible in Widgetbook!',
            style: GoogleFonts.leagueSpartan(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentToggle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F5FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRightContent = 'Styles & Salons';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedRightContent == 'Styles & Salons'
                        ? const Color(0xFF7F38FF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Styles & Salons',
                    style: GoogleFonts.leagueSpartan(
                      color: selectedRightContent == 'Styles & Salons'
                          ? Colors.white
                          : const Color(0xFF7F38FF),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRightContent = 'Detailed Style View';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedRightContent == 'Detailed Style View'
                        ? const Color(0xFF7F38FF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Detailed View',
                    style: GoogleFonts.leagueSpartan(
                      color: selectedRightContent == 'Detailed Style View'
                          ? Colors.white
                          : const Color(0xFF7F38FF),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRightContent() {
    if (selectedRightContent == 'Detailed Style View') {
      return _buildDetailedStyleView();
    } else {
      return _buildStylesAndSalons();
    }
  }

  Widget _buildStylesAndSalons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
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
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _styles.length,
                  itemBuilder: (context, index) {
                    final style = _styles[index];
                    return Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(style.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            style.name,
                            style: GoogleFonts.leagueSpartan(
                              color: const Color(0xFF332749),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
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
                      itemCount: _salons.length,
                      itemBuilder: (context, index) =>
                          _buildSalonCard(_salons[index]),
                      physics: const AlwaysScrollableScrollPhysics(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSalonCard(SalonData salon) {
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
                    fontWeight: FontWeight.w700,
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

  Widget _buildDetailedStyleView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Box Braids',
            style: GoogleFonts.leagueSpartan(
              color: const Color(0xFF332749),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'KES 3000 | Hair included',
            style: GoogleFonts.leagueSpartan(
              color: const Color(0xFF332749),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              RatingStars(filledStars: 4, size: 16),
              const SizedBox(width: 8),
              Text(
                '12 Reviews',
                style: GoogleFonts.leagueSpartan(
                  color: const Color(0xFF332749),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Style images
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                final images = [
                  'assets/images/BraidsOne.png',
                  'assets/images/BraidsTwo.png',
                  'assets/images/BraidsThree.png',
                  'assets/images/BraidsFour.png',
                ];
                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // Date selection
          _buildSelectionField(
              'Select a Date', Icons.calendar_today, 'Choose date...'),
          const SizedBox(height: 16),

          // Time selection
          _buildSelectionField(
              'Select a Time', Icons.access_time, 'Choose time...'),
          const SizedBox(height: 20),

          // Hair type
          _buildSelectionField('Hair type/colour', Icons.face,
              'Eg; 1B, 27, Black, Blonde, Mixed colours'),
          const SizedBox(height: 20),

          // Options
          _buildOption('Small braids', '+200', false),
          _buildOption('Wash and dry', '+200', true),
          _buildOption('One extra braider', '+500', true),
          _buildOption('Deep condition', '+200', false),
          _buildOption('Extra long braids', '+200', false),
          const SizedBox(height: 20),

          // Book button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF332749),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Book Service',
                style: GoogleFonts.leagueSpartan(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionField(String title, IconData icon, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.leagueSpartan(
            color: const Color(0xFF3A0F88),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F4FF),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Icon(icon, color: const Color(0xFF7F38FF), size: 20),
              const SizedBox(width: 8),
              Text(
                placeholder,
                style: GoogleFonts.leagueSpartan(
                  color: const Color(0xCC3A0F88),
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOption(String text, String price, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF332749) : Colors.transparent,
              border: Border.all(
                color: const Color(0xFF332749),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: isSelected
                ? const Icon(
                    Icons.check,
                    size: 12,
                    color: Colors.white,
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Text(
            '$text $price',
            style: GoogleFonts.leagueSpartan(
              color: const Color(0xFF332749),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  // Builds the standard bottom navigation bar.
  Widget _buildBottomNavBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ProfileIconButton(
            isActive: false,
            onTap: () {},
          ),
          HomeIconButton(
            isActive: false,
            onTap: () {},
          ),
          SalonsIconButton(
            isActive: true, // Salons is active
            onTap: () {},
          ),
          ChatIconButton(
            isActive: false,
            onTap: () {},
          ),
          OrdersIconButton(
            isActive: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _HoverFillButton extends StatefulWidget {
  const _HoverFillButton({super.key});

  @override
  State<_HoverFillButton> createState() => _HoverFillButtonState();
}

class _HoverFillButtonState extends State<_HoverFillButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: OutlinedButton(
        onPressed: () {
          // TODO: Implement action
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Color(0xFF7F38FF)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          backgroundColor: _isHovered ? Color(0xFF7F38FF) : Colors.transparent,
        ),
        child: Text(
          'Read Her Story',
          style: GoogleFonts.leagueSpartan(
            color: _isHovered ? Colors.white : const Color(0xFF7F38FF),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// Add _DesktopSalonListItem widget (copied from home_template.dart)
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

// Add the detailed style view widget
class DetailedStyleView extends StatelessWidget {
  const DetailedStyleView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with price and hair included
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Box Braids',
                  style: GoogleFonts.leagueSpartan(
                    color: const Color(0xFF332749),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),

            // Price and hair included info
            Text(
              'KES 3000 | Hair included',
              style: GoogleFonts.leagueSpartan(
                color: const Color(0xFF332749),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),

            // Rating stars
            Row(
              children: [
                RatingStars(filledStars: 4, size: 20),
                const SizedBox(width: 8),
                Text(
                  '12 Reviews',
                  style: GoogleFonts.leagueSpartan(
                    color: const Color(0xFF332749),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Style images grid
            SizedBox(
              height: 120,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/BraidsOne.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/BraidsTwo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/BraidsThree.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/BraidsFour.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Date selection
            Text(
              'Select a Date',
              style: GoogleFonts.leagueSpartan(
                color: const Color(0xFF3A0F88),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F4FF),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Color(0xFF7F38FF)),
                  const SizedBox(width: 8),
                  Text(
                    'Choose date...',
                    style: GoogleFonts.leagueSpartan(
                      color: const Color(0xCC3A0F88),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Time selection
            Text(
              'Select a Time',
              style: GoogleFonts.leagueSpartan(
                color: const Color(0xFF3A0F88),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F4FF),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  const Icon(Icons.access_time, color: Color(0xFF7F38FF)),
                  const SizedBox(width: 8),
                  Text(
                    'Choose time...',
                    style: GoogleFonts.leagueSpartan(
                      color: const Color(0xCC3A0F88),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Hair type selection
            Text(
              'Hair type/colour',
              style: GoogleFonts.leagueSpartan(
                color: const Color(0xFF3A0F88),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F4FF),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                'Eg; 1B, 27, Black, Blonde, Mixed colours',
                style: GoogleFonts.leagueSpartan(
                  color: const Color(0xCC3A0F88),
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Additional options
            _buildOption('Small braids', '+200', false),
            _buildOption('Wash and dry', '+200', true),
            _buildOption('One extra braider', '+500', true),
            _buildOption('Deep condition', '+200', false),
            _buildOption('Extra long braids', '+200', false),
            const SizedBox(height: 20),

            // Book service button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF332749),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Book Service',
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String text, String price, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF332749) : Colors.transparent,
              border: Border.all(
                color: const Color(0xFF332749),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: isSelected
                ? const Icon(
                    Icons.check,
                    size: 12,
                    color: Colors.white,
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Text(
            '$text $price',
            style: GoogleFonts.leagueSpartan(
              color: const Color(0xFF332749),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
