import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/custom_input_field.dart';
import '../components/button.dart';
import '../components/social_login_section.dart';
import '../components/gradient_background.dart';
import 'login_screen_refactored.dart';

class LoginScreenResponsive extends StatelessWidget {
  const LoginScreenResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Desktop Login Screen',
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
          // Use LoginScreenRefactored for screens narrower than 600px
          if (constraints.maxWidth < 600) {
            return const LoginScreenRefactored();
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
    final cardWidth = 1287.0;
    final cardHeight = 856.79;
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
      actualHeight = constraints.maxHeight * 0.8; // Use 80% of screen height
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
            double imageWidth = containerWidth * 0.4;
            double formWidth = containerWidth * 0.6;

            // Adjust proportions for different screen sizes
            if (containerWidth > 1000) {
              imageWidth = containerWidth * 0.5;
              formWidth = containerWidth * 0.5;
            } else if (containerWidth < 600) {
              imageWidth = containerWidth * 0.35;
              formWidth = containerWidth * 0.65;
            }

            return Container(
              width: containerWidth,
              height: innerConstraints.maxHeight,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1 * scaleFactor, // Scale border width
                    color: Color(0x0C7F38FF),
                  ),
                  borderRadius: BorderRadius.circular(
                      24 * scaleFactor), // Scale border radius
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x417F38FF),
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
                            "assets/images/BN_Login_BG.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Logo
                        Positioned(
                          left: imageWidth * 0.05,
                          top: innerConstraints.maxHeight * 0.05,
                          child: Container(
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
                    top: innerConstraints.maxHeight * 0.09,
                    width: formWidth * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello!',
                          style: GoogleFonts.leagueSpartan(
                            color: const Color(0xFF7F38FF),
                            fontSize: titleSize, // Use calculated size
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // const SizedBox(height: 1),
                        Text(
                          'Please Sign in below',
                          style: GoogleFonts.leagueSpartan(
                            color: const Color(0xFF7F38FF),
                            fontSize: subtitleSize, // Use calculated size
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: constraints.maxWidth > 600 ? 70 : 65),
                        CustomInputField(
                          label: 'Email Address',
                          hintText: 'Enter your email',
                          controller: TextEditingController(),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        CustomInputField(
                          label: 'Password',
                          hintText: 'Enter your password',
                          isPassword: true,
                          controller: TextEditingController(),
                        ),
                        SizedBox(height: innerConstraints.maxHeight * 0.03),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            text: 'Login',
                            onPressed: () {},
                            isPrimary: true,
                          ),
                        ),
                        SizedBox(height: innerConstraints.maxHeight * 0.02),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot my password',
                            style: GoogleFonts.leagueSpartan(
                              color: const Color(0xFF332749),
                              fontSize: bodySize, // Use calculated size
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: innerConstraints.maxHeight * 0.03),
                        // This inner Column holds the bottom part of the form
                        Column(
                          children: [
                            Center(
                                child: SocialLoginSection(
                              iconSize: 30.0,
                              fontSize: socialTextSize,
                            )),
                            const SizedBox(height: 30),
                            Center(
                              child: GestureDetector(
                                onTap: () {},
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Don't have an account? ",
                                        style: GoogleFonts.leagueSpartan(
                                          color: Colors.black,
                                          fontSize:
                                              bodySize, // Use calculated size
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Sign Up',
                                        style: GoogleFonts.leagueSpartan(
                                          color: const Color(0xFF3A0F88),
                                          fontSize:
                                              bodySize, // Use calculated size
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
