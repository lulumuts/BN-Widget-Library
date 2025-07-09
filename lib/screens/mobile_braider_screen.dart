import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/atoms/service_button.dart';
import '../components/atoms/rating_stars.dart';
import '../components/models/service_data.dart';

class MobileBraiderScreen extends StatefulWidget {
  const MobileBraiderScreen({super.key});

  @override
  State<MobileBraiderScreen> createState() => _MobileBraiderScreenState();
}

class _MobileBraiderScreenState extends State<MobileBraiderScreen> {
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
          _buildTitleOverlay(),
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
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              border: Border(top: BorderSide(color: Color(0xFFEEE4FF))),
            ),
            child: Center(
              child: Text(
                '🚨 IF YOU SEE THIS, THE WHITE CONTAINER WORKS! 🚨',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
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
            'DEBUG: Mobile Braider Screen is working!',
            style: GoogleFonts.leagueSpartan(
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.w700,
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
                  fontSize: 14,
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
}
