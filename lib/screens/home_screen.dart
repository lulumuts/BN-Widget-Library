import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// A data model for the popular salon list items. This makes the list data-driven.
class _SalonInfo {
  final String imageUrl;
  final String name;
  final String style;
  final String price;

  const _SalonInfo({
    required this.imageUrl,
    required this.name,
    required this.style,
    required this.price,
  });
}

class NewHomePage extends StatelessWidget {
  const NewHomePage({super.key});

  // Dummy data for the popular salons list.
  static const _popularSalons = [
    _SalonInfo(
        imageUrl: "https://placehold.co/85x80",
        name: "Doris’ Salon - Stall 222",
        style: "Bob Braids",
        price: "1500 KES"),
    _SalonInfo(
        imageUrl: "https://placehold.co/85x78",
        name: "Linet’s Salon - Stall 10",
        style: "Twist Braids",
        price: "2300 KES"),
    _SalonInfo(
        imageUrl: "https://placehold.co/82x75",
        name: "Maggy’s Salon - Stall 321",
        style: "Box Braids",
        price: "2000 KES"),
    _SalonInfo(
        imageUrl: "https://placehold.co/87x81",
        name: "Connie’s Salon - Stall 55",
        style: "Bob Braids",
        price: "1500 KES"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildContent(context),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // Builds the radial gradient background.
  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -1.2), // Adjusted for a top-down effect
          radius: 1.0,
          colors: [
            Color(0xFF7F38FF),
            Color(0xFFCBAEFF),
            Color(0xFFDECCFF),
            Color(0xFFEEE4FF),
            Colors.white
          ],
          stops: [0.0, 0.25, 0.5, 0.75, 1.0], // More control over the gradient
        ),
      ),
    );
  }

  // Builds the main scrollable content of the page.
  Widget _buildContent(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 59),
            child: Column(
              children: [
                _buildPromoBanner(),
                const SizedBox(
                    height:
                        21), // Spacing to position the top of the white card
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
                _buildServicesSection(),
                const SizedBox(height: 32),
                _buildStylesSection(),
                const SizedBox(height: 32),
                _buildPopularSalonsSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Builds the promotional banner at the top.
  Widget _buildPromoBanner() {
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

  // Builds the "Our Services" section with two action buttons.
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
              letterSpacing: 0.32,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                  child: _ServiceButton(
                      text: "Book a New Look",
                      imageUrl: "https://placehold.co/19x19",
                      isPrimary: true)),
              const SizedBox(width: 12),
              Expanded(
                  child: _ServiceButton(
                      text: "Book Braids Removal",
                      isPrimary: false,
                      iconData: Icons.close_rounded)),
            ],
          ),
        ],
      ),
    );
  }

  // Builds the "Our Styles" section with a horizontal list of style categories.
  Widget _buildStylesSection() {
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
              _StyleItem(
                  imageUrl: "https://placehold.co/78x78", name: "Braids"),
              const SizedBox(width: 20),
              _StyleItem(imageUrl: "https://placehold.co/102x78", name: "Locs"),
              const SizedBox(width: 20),
              _StyleItem(
                  imageUrl: "https://placehold.co/103x81", name: "Twists"),
              const SizedBox(width: 20),
              _StyleItem(
                  imageUrl: "https://placehold.co/121x78", name: "Lines"),
            ],
          ),
        ),
      ],
    );
  }

  // Builds the "Popular Salons" section using a data-driven list.
  Widget _buildPopularSalonsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
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
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F6FC),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: _popularSalons
                  .map((salon) => _SalonListItem(info: salon))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  // Builds the standard bottom navigation bar.
  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 1, // 'Home' is the selected item
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

// A reusable widget for the buttons in the "Our Services" section.
class _ServiceButton extends StatelessWidget {
  final String text;
  final String? imageUrl;
  final IconData? iconData;
  final bool isPrimary;

  const _ServiceButton({
    required this.text,
    this.imageUrl,
    this.iconData,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    final color = isPrimary ? Colors.white : const Color(0xFF332749);
    final bgColor = isPrimary ? const Color(0xFF332749) : Colors.transparent;
    final borderColor =
        isPrimary ? Colors.transparent : const Color(0xFF332749);

    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imageUrl != null)
            CircleAvatar(
              radius: 13.5,
              backgroundColor: color,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network(imageUrl!),
              ),
            ),
          if (iconData != null)
            CircleAvatar(
              radius: 13.5,
              backgroundColor: const Color(0xFF332749),
              child: Icon(iconData, size: 18, color: Colors.white),
            ),
          const SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.leagueSpartan(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// A reusable widget for the items in the "Our Styles" section.
class _StyleItem extends StatelessWidget {
  final String imageUrl;
  final String name;

  const _StyleItem({required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Using ClipOval to ensure the placeholder image is circular
        ClipOval(
          child: Image.network(
            imageUrl,
            width: 78,
            height: 78,
            fit: BoxFit.cover,
            // A fallback for when images are loading or fail
            loadingBuilder: (context, child, progress) => progress == null
                ? child
                : const SizedBox(
                    width: 78,
                    height: 78,
                    child: Center(child: CircularProgressIndicator())),
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
}

// A reusable widget for the list items in the "Popular Salons" section.
class _SalonListItem extends StatelessWidget {
  final _SalonInfo info;

  const _SalonListItem({required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              info.imageUrl,
              width: 85,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  info.name,
                  style: GoogleFonts.leagueSpartan(
                    color: const Color(0xFF332749),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  info.style,
                  style: GoogleFonts.leagueSpartan(
                    color: const Color(0xFF332749),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  info.price,
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
