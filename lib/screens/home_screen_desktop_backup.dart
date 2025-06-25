import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Reusing the same data model from the mobile version
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
      child: Stack(
        children: [
          // Centered text
          Center(
            child: Text(
              text,
              style: GoogleFonts.leagueSpartan(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Left positioned icon
          Positioned(
            left: 16,
            top: 0,
            bottom: 0,
            child: Center(
              child: Row(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});

  // Same data as mobile version
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
                  const SizedBox(width: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildRightSection(),
                      // const SizedBox(height: 4),
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
            // Logo
            SvgPicture.asset(
              "assets/images/logo.svg",
              width: 59.80,
              height: 65.17,
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
        return Container(
          width: MediaQuery.of(context).size.width > 1800 ? 800 : 400,
          height: 832,
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
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
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
                      borderRadius: const BorderRadius.only(
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

  // Builds the right content section
  Widget _buildRightSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: MediaQuery.of(context).size.width > 1800 ? 750 : 700,
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
        return Container(
          width: MediaQuery.of(context).size.width > 1800 ? 750 : 700,
          height: 740,
          padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 40),
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
            padding: EdgeInsets.all(3),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStylesSection(),
                  const SizedBox(height: 24),
                  _buildPopularSalonsSection(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Builds the "Our Services" section with two action buttons.
  Widget _buildServicesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        const SizedBox(height: 8),
        const SizedBox(
          width: 700,
          child: Row(
            children: [
              Expanded(
                  child: _ServiceButton(
                      text: "Book a New Look",
                      imageUrl: "https://placehold.co/19x19",
                      isPrimary: true)),
              SizedBox(width: 12),
              Expanded(
                  child: _ServiceButton(
                      text: "Book Braids Removal",
                      isPrimary: false,
                      iconData: Icons.close_rounded)),
            ],
          ),
        ),
      ],
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _DesktopStyleItem(
              imageUrl: "https://placehold.co/102x99",
              name: "Braids",
            ),
            _DesktopStyleItem(
              imageUrl: "https://placehold.co/110x84",
              name: "Locs",
            ),
            _DesktopStyleItem(
              imageUrl: "https://placehold.co/128x101",
              name: "Twists",
            ),
            _DesktopStyleItem(
              imageUrl: "https://placehold.co/121x78",
              name: "Lines",
            ),
          ],
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
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F6FC),
            borderRadius: BorderRadius.circular(24),
          ),
          child: SizedBox(
            height: 416, // or your preferred height
            child: ListView.builder(
              itemCount: _popularSalons.length,
              itemBuilder: (context, index) =>
                  _DesktopSalonListItem(info: _popularSalons[index]),
              physics: AlwaysScrollableScrollPhysics(),
            ),
          ),
        ),
      ],
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
        fontSize: 20,
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
    return Row(
      children: [
        Transform.rotate(
          angle: 0.69,
          child: Container(
            width: 10.53,
            height: 3,
            decoration: const BoxDecoration(
              color: Color(0xFF665D76),
              borderRadius: BorderRadius.all(Radius.circular(1.5)),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Transform.rotate(
          angle: -0.69,
          child: Container(
            width: 10.53,
            height: 3,
            decoration: const BoxDecoration(
              color: Color(0xFF665D76),
              borderRadius: BorderRadius.all(Radius.circular(1.5)),
            ),
          ),
        ),
      ],
    );
  }
}

// Desktop service button widget
class _DesktopServiceButton extends StatelessWidget {
  final String text;
  final String? imageUrl;
  final IconData? iconData;
  final bool isPrimary;

  const _DesktopServiceButton({
    required this.text,
    this.imageUrl,
    this.iconData,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    final bgColor = Colors.transparent;
    final borderColor =
        isPrimary ? Colors.transparent : const Color(0xFF332749);

    return Container(
      height: 84,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imageUrl != null)
            CircleAvatar(
              radius: 19,
              backgroundColor: color,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network(imageUrl!),
              ),
            ),
          if (iconData != null)
            CircleAvatar(
              radius: 19,
              backgroundColor: const Color(0xFF332749),
              child: Icon(iconData, size: 20, color: Colors.white),
            ),
          const SizedBox(width: 12),
          Text(
            text,
            style: GoogleFonts.leagueSpartan(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// Desktop style item widget
class _DesktopStyleItem extends StatelessWidget {
  final String imageUrl;
  final String name;

  const _DesktopStyleItem({required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            imageUrl,
            width: 102,
            height: 99,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) => progress == null
                ? child
                : const SizedBox(
                    width: 102,
                    height: 99,
                    child: Center(child: CircularProgressIndicator())),
            errorBuilder: (context, error, stackTrace) => Container(
              width: 102,
              height: 99,
              color: Colors.grey[200],
              child: Icon(Icons.error, color: Colors.grey[400]),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          name,
          style: GoogleFonts.leagueSpartan(
            color: const Color(0xFF332749),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// Desktop salon list item widget
class _DesktopSalonListItem extends StatelessWidget {
  final _SalonInfo info;

  const _DesktopSalonListItem({required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: ClipOval(
              child: Image.network(
                info.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
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
