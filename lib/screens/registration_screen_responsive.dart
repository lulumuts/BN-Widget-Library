import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/atoms/custom_input_field.dart';
import '../components/atoms/custom_button.dart';
import '../components/atoms/social_login_section.dart';
import 'registration_screen_refactored.dart';

class RegistrationScreenResponsive extends StatelessWidget {
  const RegistrationScreenResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Desktop Registration Screen',
          style: GoogleFonts.leagueSpartan(
            color: const Color(0xFF332749),
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Use RegistrationScreenRefactored for screens narrower than 600px
          if (constraints.maxWidth < 680) {
            return const RegistrationScreenRefactored();
          }
          return _buildDesktopLayout(context, constraints);
        },
      ),
    );
  }

  // --- NEW: Helper function for consistent font scaling ---
  double _calculateFontSize(
      BoxConstraints constraints, double minSize, double maxSize) {
    const minWidth = 800; // The breakpoint where desktop view starts
    const maxWidth = 1300; // The width at which fonts should be their max size

    // Ensure we don't go below the min or above the max
    final currentWidth = constraints.maxWidth.clamp(minWidth, maxWidth);

    // Calculate the interpolation factor (0.0 to 1.0)
    final t = (currentWidth - minWidth) / (maxWidth - minWidth);

    // Linearly interpolate between the min and max font sizes
    return minSize + t * (maxSize - minSize);
  }

  Widget _buildDesktopLayout(BuildContext context, BoxConstraints constraints) {
    // Define the card dimensions while maintaining aspect ratio
    const cardWidth = 1487.0;
    const cardHeight = 1000.0;
    var aspectRatio = cardWidth / cardHeight;

    // --- NEW: For smaller desktop screens, use a taller aspect ratio. ---
    if (constraints.maxWidth < 1300) {
      aspectRatio = 1.35; // A smaller aspect ratio = a taller card
    }

    // Calculate the actual dimensions based on available space
    double actualWidth = cardWidth;
    double actualHeight = cardWidth / aspectRatio;

    // --- NEW LOGIC FOR LARGE SCREENS ---
    // If the screen is very tall, make the card larger to fill more space.
    if (constraints.maxHeight > 1100) {
      actualHeight = constraints.maxHeight * 0.9; // Use 80% of screen height
      actualWidth = actualHeight * aspectRatio;
    }

    // If the screen is smaller than the desired width, scale down proportionally
    if (constraints.maxWidth < actualWidth + 40) {
      // Reduced padding from 120 to 40
      actualWidth = constraints.maxWidth - 40;
      actualHeight = actualHeight * aspectRatio;
    }

    // If the screen is smaller than the desired height, scale down proportionally
    if (constraints.maxHeight < actualHeight + 40) {
      // Reduced padding from 120 to 40
      actualHeight = constraints.maxHeight - 40;
      actualWidth = actualHeight * aspectRatio;
    }

    // Scale factor for responsive sizing
    final scaleFactor = actualWidth / cardWidth;

    // --- NEW: Calculate font sizes using our consistent function ---
    final titleSize = _calculateFontSize(constraints, 32, 40);
    final subtitleSize = _calculateFontSize(constraints, 18, 24);
    final bodySize = _calculateFontSize(constraints, 16, 18);
    final socialTextSize = _calculateFontSize(constraints, 16, 18);

    return Center(
      child: Container(
        width: actualWidth,
        height: actualHeight,
        padding: EdgeInsets.all(60.0 * scaleFactor), // Scale padding
        child: LayoutBuilder(
          builder: (context, innerConstraints) {
            // Calculate responsive widths
            double containerWidth = innerConstraints.maxWidth;
            double maxFormWidth = 600;
            double minImageWidth = 600; // or 400, etc.

            double formWidth = containerWidth > (maxFormWidth + minImageWidth)
                ? maxFormWidth
                : containerWidth * 0.6;
            double imageWidth = containerWidth * 0.5; // 50% of the container
            if (imageWidth < minImageWidth) {
              imageWidth = minImageWidth;
              formWidth = containerWidth - imageWidth;
            }

            return Container(
              width: containerWidth,
              height: innerConstraints.maxHeight,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1 * scaleFactor, // Scale border width
                    color: const Color(0x0C7F38FF),
                  ),
                  borderRadius: BorderRadius.circular(
                      24 * scaleFactor), // Scale border radius
                ),
                shadows: [
                  BoxShadow(
                    color: const Color(0x417F38FF),
                    blurRadius: 25 * scaleFactor, // Scale blur radius
                    offset: Offset(0, 4 * scaleFactor), // Scale offset
                    spreadRadius: 13 * scaleFactor, // Scale spread radius
                  )
                ],
              ),
              child: Stack(
                children: [
                  // Left side image container
                  Container(
                    width: imageWidth,
                    height: innerConstraints.maxHeight,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xBFE9DDFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            24 * scaleFactor), // Scale border radius
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Background image
                        Positioned.fill(
                          child: Image.asset(
                            "assets/images/Registration_bg.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Logo
                        Positioned(
                          left: imageWidth * 0.05,
                          top: innerConstraints.maxHeight * 0.05,
                          child: SizedBox(
                            width: imageWidth * 0.15,
                            height: imageWidth * 0.15,
                            child: SvgPicture.asset(
                              "assets/images/BN_LOGO.svg",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Right side white container
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: formWidth,
                      height: innerConstraints.maxHeight,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(24 * scaleFactor),
                            bottomRight: Radius.circular(24 * scaleFactor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Right side content
                  Positioned(
                    right: formWidth * 0.1,
                    top: innerConstraints.maxHeight * 0.06,
                    width: formWidth * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome!',
                          style: GoogleFonts.leagueSpartan(
                            color: const Color(0xFF7F38FF),
                            fontSize: titleSize, // Use calculated size
                            fontWeight: FontWeight.w700,
                            height: 1.25, // Reduce line height
                          ),
                        ),
                        Text(
                          'Create your account below',
                          style: GoogleFonts.leagueSpartan(
                            color: const Color(0xFF7F38FF),
                            fontSize: subtitleSize, // Use calculated size
                            fontWeight: FontWeight.w500,
                            height: 0.9, // Reduce line height
                          ),
                        ),
                        SizedBox(height: constraints.maxWidth > 600 ? 30 : 45),
                        CustomInputField(
                          label: 'Full Name',
                          hintText: 'Enter your full name',
                          controller: TextEditingController(),
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'This is not an email',
                          style: GoogleFonts.leagueSpartan(
                            color: const Color(0xFF666666),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomInputField(
                          label: 'Email',
                          hintText: 'Enter your email',
                          controller: TextEditingController(),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'This is not an email',
                          style: GoogleFonts.leagueSpartan(
                            color: const Color(0xFF666666),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomInputField(
                          label: 'Phone Number',
                          hintText: 'Enter your phone number',
                          controller: TextEditingController(),
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'This is not an email',
                          style: GoogleFonts.leagueSpartan(
                            color: const Color(0xFF666666),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomInputField(
                          label: 'Password',
                          hintText: 'Enter your password',
                          isPassword: true,
                          controller: TextEditingController(),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'This is not an email',
                          style: GoogleFonts.leagueSpartan(
                            color: const Color(0xFF666666),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            text: 'Sign Up',
                            onPressed: () {},
                            isPrimary: true,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                value:
                                    false, // You can add state management for this
                                onChanged: (value) {
                                  // Handle checkbox state change
                                },
                                activeColor: const Color(0xFF332749),
                                side: const BorderSide(
                                  color: Color(0xFF332749),
                                  width: 2,
                                ),
                              ),
                              Flexible(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'I agree to the ',
                                        style: GoogleFonts.leagueSpartan(
                                          color: const Color(0xFF332749),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Terms and Conditions',
                                        style: GoogleFonts.leagueSpartan(
                                          color: const Color(0xFF7F38FF),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        SocialLoginSection(
                          headerText: 'Or sign up with',
                          fontSize: 16,
                          iconSize: 24.0,
                          onGoogleTap: () {
                            // Handle Google sign up
                          },
                          onAppleTap: () {
                            // Handle Apple sign up
                          },
                          onFacebookTap: () {
                            // Handle Facebook sign up
                          },
                        ),
                        const SizedBox(height: 4),
                        // This inner Column holds the bottom part of the form
                        Column(
                          children: [
                            const SizedBox(height: 6),
                            Center(
                              child: GestureDetector(
                                onTap: () {},
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Already have an account? ",
                                        style: GoogleFonts.leagueSpartan(
                                          color: const Color(0xFF332749),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Sign In',
                                        style: GoogleFonts.leagueSpartan(
                                          color: const Color(0xFF3A0F88),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
