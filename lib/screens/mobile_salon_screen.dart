import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/molecules/salon_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MobileSalonScreen extends StatelessWidget {
  final int selectedLeftOption;

  const MobileSalonScreen({super.key, this.selectedLeftOption = 0});

  int get safeSelectedLeftOption {
    return selectedLeftOption.clamp(0, leftOptions.length - 1);
  }

  // Left container options data
  static const List<Map<String, String>> leftOptions = [
    {'title': 'Braids', 'image': 'assets/images/Braids.png'},
    {'title': 'Lines', 'image': 'assets/images/Lines.png'},
    {'title': 'Twists', 'image': 'assets/images/Twists.png'},
    {'title': 'Locs', 'image': 'assets/images/Locs.png'},
    {'title': 'Weaves', 'image': 'assets/images/Weaves.png'},
    {'title': 'Natural', 'image': 'assets/images/Maintenance.png'},
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

  // Builds the background image.
  Widget _buildBackground() {
    return Transform.translate(
      offset: const Offset(0, -380), // Move image up by 200 pixels
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(leftOptions[safeSelectedLeftOption]['image']!),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  // Builds the title overlay positioned on top of the background image
  Widget _buildTitleOverlay() {
    return Positioned(
      top: 100, // Position in the middle of the 200px space
      left: 0,
      right: 0,
      child: Center(
        child: Text(
          leftOptions[safeSelectedLeftOption]['title']!,
          style: GoogleFonts.leagueSpartan(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.bold,
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
      ),
    );
  }

  // Builds the main content of the page.
  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        // Spacing area for background image
        SizedBox(
          height: 200, // 59px padding + 100px spacing
        ),
        // White card container
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
            child: SingleChildScrollView(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSalonsGridSection(constraints),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Builds the "Salons" section with a scrollable grid of salon cards.
  Widget _buildSalonsGridSection(BoxConstraints constraints) {
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
          SizedBox(
            height: 650, // Fixed height for the grid
            child: GridView.builder(
              itemCount: 12, // 12 cards total for better scrolling
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio:
                    1.0, // Adjusted for mobile (increased height by 50% from original)
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
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Profile_Icon.svg',
            width: 24,
            height: 24,
          ),
          label: "Profile",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Home_Icon.svg',
            width: 24,
            height: 24,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/Salon Icon.svg',
            width: 24,
            height: 24,
          ),
          label: "Salons",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/chat_icon.svg',
            width: 24,
            height: 24,
          ),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/orders_icon.svg',
            width: 24,
            height: 24,
          ),
          label: "Orders",
        ),
      ],
    );
  }
}
