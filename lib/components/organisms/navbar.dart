import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navbar extends StatelessWidget {
  final String activeTab;
  final VoidCallback? onLuluMenuTap;

  const Navbar({
    super.key,
    this.activeTab = 'Orders',
    this.onLuluMenuTap,
  });

  @override
  Widget build(BuildContext context) {
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
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/BN_LOGO.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Spacer(),
            NavItem(text: "Home", isSelected: activeTab == "Home"),
            const SizedBox(width: 40),
            NavItem(text: "Salons", isSelected: activeTab == "Salons"),
            const SizedBox(width: 40),
            NavItem(text: "Chat", isSelected: activeTab == "Chat"),
            const SizedBox(width: 40),
            NavItem(text: "Orders", isSelected: activeTab == "Orders"),
            const SizedBox(width: 40),
            // Lulu + chevron as dropdown
            GestureDetector(
              onTap: onLuluMenuTap,
              child: Row(
                children: [
                  NavItem(text: "Lulu", isSelected: activeTab == "Lulu"),
                  const SizedBox(width: 4),
                  const CloseButton(isDropdown: true),
                ],
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const NavItem({super.key, required this.text, this.isSelected = false});

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

class CloseButton extends StatelessWidget {
  final bool isDropdown;
  const CloseButton({super.key, this.isDropdown = false});

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
