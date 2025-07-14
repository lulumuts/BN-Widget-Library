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
import '../components/organisms/order_status_list_view.dart';
import '../components/organisms/navbar.dart';

class OrdersTemplate extends StatefulWidget {
  final int? selectedLeftOption;
  final String? rightContentOption;
  const OrdersTemplate(
      {super.key, this.selectedLeftOption, this.rightContentOption});

  @override
  State<OrdersTemplate> createState() => _OrdersTemplateState();
}

class _OrdersTemplateState extends State<OrdersTemplate> {
  int selectedLeftOptionInternal = 0;

  // Internal state for right content, used if widget.rightContentOption is null
  String rightContentOptionInternal = 'Orders List';
  final List<String> rightContentOptions = [
    'Orders List',
    'Order Details',
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
          final isMobile =
              screenWidth < 800; // Mobile breakpoint - match braider screen

          if (isMobile) {
            return MobileOrdersPreview();
          } else {
            return Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const Navbar(activeTab: 'Orders'),
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

        // Add 122px to match the braider template's navigation section height
        containerHeight += 100;

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
          child: selectedOption == 'Order Details'
              ? const Center(child: Text('Order Details View'))
              : const Center(child: OrderStatusListView()),
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

class OrdersScreenDesktop extends StatelessWidget {
  const OrdersScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Use mobile view for screens narrower than 800px
          if (constraints.maxWidth < 800) {
            print(
                'DEBUG: Using MobileOrdersPreview, width: ${constraints.maxWidth}');
            return const MobileOrdersPreview();
          }
          print('DEBUG: Using OrdersTemplate, width: ${constraints.maxWidth}');
          return const OrdersTemplate();
        },
      ),
    );
  }
}

class MobileOrdersPreview extends StatefulWidget {
  const MobileOrdersPreview({super.key});

  @override
  State<MobileOrdersPreview> createState() => _MobileOrdersPreviewState();
}

class _MobileOrdersPreviewState extends State<MobileOrdersPreview> {
  int selectedLeftOption = 0;
  String selectedRightContent = 'Orders List';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Mobile content - simplified for orders
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                child: const Center(
                  child: OrderStatusListView(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: const Color(0xFFEEE4FF),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HomeIconButton(
            isActive: false,
            onTap: () {},
          ),
          SalonsIconButton(
            isActive: false,
            onTap: () {},
          ),
          ChatIconButton(
            isActive: false,
            onTap: () {},
          ),
          OrdersIconButton(
            isActive: true,
            onTap: () {},
          ),
          ProfileIconButton(
            isActive: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
