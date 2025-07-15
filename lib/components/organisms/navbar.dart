import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navbar extends StatefulWidget {
  final String activeTab;
  const Navbar({super.key, this.activeTab = 'Orders'});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo placeholder
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SizedBox(
              width: 59.80,
              height: 65.17,
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/BN_LOGO.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NavItem(text: "Home", isSelected: widget.activeTab == "Home"),
              const SizedBox(width: 40),
              NavItem(text: "Salons", isSelected: widget.activeTab == "Salons"),
              const SizedBox(width: 40),
              NavItem(text: "Chat", isSelected: widget.activeTab == "Chat"),
              const SizedBox(width: 40),
              NavItem(text: "Orders", isSelected: widget.activeTab == "Orders"),
              const SizedBox(width: 16),
              // User + chevron as dropdown
              PopupMenuButton<String>(
                offset: const Offset(1, 64),
                constraints: const BoxConstraints(minWidth: 165),
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                onSelected: (value) {
                  // Handle menu selection here
                  if (value == 'Logout') {
                    // Example: Navigator.of(context).pushReplacementNamed('/login');
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'Edit Profile',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Edit_Profile.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFF332749),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Profile',
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF332749),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'SignOut',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Sign_Out_Icon.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFF332749),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Sign Out',
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF332749),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'DeleteAccount',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Delete_Account.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFF332749),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Delete Account',
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF332749),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                child: _UserDropdownButton(
                  isActive: widget.activeTab == "User",
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: widget.activeTab == "User"
                                  ? const Color(0xFF7F38FF)
                                  : const Color(0xBF332749),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/Profile_Icon.svg',
                              width: 20,
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                widget.activeTab == "User"
                                    ? const Color(0xFF7F38FF)
                                    : const Color(0xBF332749),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      NavItem(
                          text: "User", isSelected: widget.activeTab == "User"),
                      const SizedBox(width: 32),
                      SvgPicture.asset(
                        'assets/images/chevron-down.svg',
                        width: 32,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          widget.activeTab == "User"
                              ? const Color(0xFF7F38FF)
                              : const Color(0xBF332749),
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
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
              const SizedBox(width: 8),
            ],
          ),
        ],
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

class _UserDropdownButton extends StatefulWidget {
  final bool isActive;
  final Widget child;
  const _UserDropdownButton({required this.isActive, required this.child});

  @override
  State<_UserDropdownButton> createState() => _UserDropdownButtonState();
}

class _UserDropdownButtonState extends State<_UserDropdownButton> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: _isHovered
              ? (widget.isActive
                  ? const Color(0x1A7F38FF)
                  : const Color(0x0C332749))
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: widget.child,
      ),
    );
  }
}
