import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/molecules/services_section.dart';
import '../components/atoms/rating_stars.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';

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
        name: "Doris' Salon - Stall 222",
        style: "Bob Braids",
        price: "1500 KES"),
    _SalonInfo(
        imageUrl: "https://placehold.co/85x78",
        name: "Linet's Salon - Stall 10",
        style: "Twist Braids",
        price: "2300 KES"),
    _SalonInfo(
        imageUrl: "https://placehold.co/82x75",
        name: "Maggy's Salon - Stall 321",
        style: "Box Braids",
        price: "2000 KES"),
    _SalonInfo(
        imageUrl: "https://placehold.co/87x81",
        name: "Connie's Salon - Stall 55",
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
          center: Alignment(0, 0.3), // Lowered position
          radius: 0.6,
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
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                _buildPromoCarousel(),
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
                _buildServicesSection(),
                const SizedBox(height: 32),
                _buildStylesSection(),
                const SizedBox(height: 16),
                _buildPopularSalonsSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Builds the promotional carousel at the top.
  Widget _buildPromoCarousel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        height: 120, // Reduced height for more compact mobile carousel
        child: _MobilePromoCarousel(),
      ),
    );
  }

  // Builds the "Our Services" section with two action buttons.
  Widget _buildServicesSection() {
    return const ServicesSection(
      isAppointmentActive: true, // Default to "Book a New Look" active
      isRemovalActive: false,
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
            children: const [
              _StyleItem(
                  imageUrl: "assets/images/Braids-button.png", name: "Braids"),
              SizedBox(width: 20),
              _StyleItem(
                  imageUrl: "assets/images/Locs-button.png", name: "Locs"),
              SizedBox(width: 20),
              _StyleItem(
                  imageUrl: "assets/images/Twists-button.png", name: "Twists"),
              SizedBox(width: 20),
              _StyleItem(
                  imageUrl: "assets/images/Lines-button.png", name: "Lines"),
              SizedBox(width: 20),
              _StyleItem(
                  imageUrl: "assets/images/Weaves-button.png", name: "Weaves"),
              SizedBox(width: 20),
              _StyleItem(
                  imageUrl: "assets/images/Natural-button.png",
                  name: "Natural"),
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
            height: 416,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F6FC),
              borderRadius: BorderRadius.circular(24),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: _popularSalons
                    .map((salon) => _SalonListItem(info: salon))
                    .toList(),
              ),
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
            child: Image.asset(
              'assets/images/icon-background.png',
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
                const SizedBox(height: 4),
                RatingStars(
                  filledStars: 2,
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

// Mobile-optimized promotional carousel
class _MobilePromoCarousel extends StatefulWidget {
  const _MobilePromoCarousel();

  @override
  State<_MobilePromoCarousel> createState() => _MobilePromoCarouselState();
}

class _MobilePromoCarouselState extends State<_MobilePromoCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, dynamic>> _carouselData = [
    {
      'image': 'assets/images/Promotion_Feature.jpg',
      'headline': TextSpan(
        children: [
          TextSpan(
              text: 'Get',
              style: GoogleFonts.leagueSpartan(
                  color: const Color(0xFF332749),
                  fontSize: 16,
                  fontWeight: FontWeight.w700)),
          TextSpan(
              text: ' 10% ',
              style: GoogleFonts.leagueSpartan(
                  color: const Color(0xFF332749),
                  fontSize: 16,
                  fontWeight: FontWeight.w700)),
          TextSpan(
              text: 'off your next Knotless Braids',
              style: GoogleFonts.leagueSpartan(
                  color: const Color(0xFF332749),
                  fontSize: 16,
                  fontWeight: FontWeight.w700)),
        ],
      ),
      'subtext': 'Book before 12 of June 2025 to\nredeem offer!',
    },
    {
      'image': 'assets/images/Promotion_Offer.png',
      'headline': TextSpan(
        children: [
          TextSpan(
              text: 'Beyond the Chair Experience',
              style: GoogleFonts.leagueSpartan(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700)),
        ],
      ),
      'subtext':
          'Discover our premium styling services\nand expert braiding techniques!',
    },
    {
      'image': 'assets/images/Promotion_profile_notification.png',
      'headline': TextSpan(
        children: [
          TextSpan(
              text: 'Stay Updated, Get Notified',
              style: GoogleFonts.leagueSpartan(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700)),
        ],
      ),
      'subtext': 'Never miss out on new styles,\noffers, and appointments!',
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      int nextPage = (_currentPage + 1) % _carouselData.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            PageView.builder(
              controller: _pageController,
              itemCount: _carouselData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final data = _carouselData[index];
                return Stack(
                  children: [
                    // Background image for this slide
                    Positioned.fill(
                      child: Image.asset(
                        data['image'],
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                    // Content overlay
                    _MobilePromoContent(
                      headline: data['headline'],
                      subtext: data['subtext'],
                      subtextColor:
                          index == 0 ? const Color(0xFF332749) : Colors.white,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _MobilePromoContent extends StatelessWidget {
  final TextSpan headline;
  final String subtext;
  final Color subtextColor;
  const _MobilePromoContent({
    required this.headline,
    required this.subtext,
    this.subtextColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              headline,
              style: GoogleFonts.leagueSpartan(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              subtext,
              style: GoogleFonts.leagueSpartan(
                color: subtextColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
