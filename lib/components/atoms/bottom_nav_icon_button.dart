import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavIconButton extends StatelessWidget {
  final String iconPath;
  final String? activeIconPath;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;
  final Color? activeColor;
  final Color? inactiveColor;

  const BottomNavIconButton({
    super.key,
    required this.iconPath,
    this.activeIconPath,
    required this.label,
    required this.isActive,
    this.onTap,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final currentIconPath =
        isActive && activeIconPath != null ? activeIconPath! : iconPath;

    final currentColor = isActive
        ? (activeColor ?? const Color(0xFF7F38FF))
        : (inactiveColor ?? const Color(0xBF332749));

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            currentIconPath,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(currentColor, BlendMode.srcIn),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.leagueSpartan(
              fontSize: 12,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              letterSpacing: 0.48,
              color: currentColor,
            ),
          ),
        ],
      ),
    );
  }
}

// Specific icon button widgets for each navigation item
class ProfileIconButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback? onTap;

  const ProfileIconButton({
    super.key,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavIconButton(
      iconPath: 'assets/icons/Profile_Icon.svg',
      activeIconPath: 'assets/icons/profile_icon_filled.svg',
      label: 'Profile',
      isActive: isActive,
      onTap: onTap,
    );
  }
}

class HomeIconButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback? onTap;

  const HomeIconButton({
    super.key,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavIconButton(
      iconPath: 'assets/icons/Home_Icon.svg',
      activeIconPath: 'assets/icons/Home_Icon_Filled.svg',
      label: 'Home',
      isActive: isActive,
      onTap: onTap,
    );
  }
}

class SalonsIconButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback? onTap;

  const SalonsIconButton({
    super.key,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavIconButton(
      iconPath: 'assets/icons/salon_icon.svg',
      label: 'Salons',
      isActive: isActive,
      onTap: onTap,
    );
  }
}

class ChatIconButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback? onTap;

  const ChatIconButton({
    super.key,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavIconButton(
      iconPath: 'assets/icons/chat_icon.svg',
      label: 'Chat',
      isActive: isActive,
      onTap: onTap,
    );
  }
}

class OrdersIconButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback? onTap;

  const OrdersIconButton({
    super.key,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavIconButton(
      iconPath: 'assets/icons/orders_icon.svg',
      activeIconPath: 'assets/icons/Orders_filled_icon.svg',
      label: 'Orders',
      isActive: isActive,
      onTap: onTap,
    );
  }
}
