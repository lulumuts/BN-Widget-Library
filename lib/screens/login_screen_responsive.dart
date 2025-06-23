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

  Widget _buildDesktopLayout(BuildContext context, BoxConstraints constraints) {
    // Define the card dimensions while maintaining aspect ratio
    final cardWidth = 1287.0;
    final cardHeight = 856.79;
    final aspectRatio = cardWidth / cardHeight;

    // Calculate the actual dimensions based on available space
    double actualWidth = cardWidth;
    double actualHeight = cardHeight;

    // If the screen is smaller than the desired width, scale down proportionally
    if (constraints.maxWidth < cardWidth + 40) {
      // Reduced padding from 120 to 40
      actualWidth = constraints.maxWidth - 40;
      actualHeight = actualWidth / aspectRatio;
    }

    // If the screen is smaller than the desired height, scale down proportionally
    if (constraints.maxHeight < actualHeight + 40) {
      // Reduced padding from 120 to 40
      actualHeight = constraints.maxHeight - 40;
      actualWidth = actualHeight * aspectRatio;
    }

    // Scale factor for responsive sizing
    final scaleFactor = actualWidth / cardWidth;

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
                            "assets/images/login_bg.png",
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
                              "assets/images/logo.svg",
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
                    top: innerConstraints.maxHeight * 0.15,
                    width: formWidth * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello!',
                          style: GoogleFonts.leagueSpartan(
                            color: const Color(0xFF7F38FF),
                            fontSize: formWidth *
                                0.06 *
                                scaleFactor, // Scale font size
                            fontWeight: FontWeight.w700,
                            letterSpacing:
                                1.60 * scaleFactor, // Scale letter spacing
                          ),
                        ),
                        SizedBox(height: 2 * scaleFactor), // Scale spacing
                        Text(
                          'Please Sign in below',
                          style: GoogleFonts.leagueSpartan(
                            color: const Color(0xFF7F38FF),
                            fontSize: formWidth *
                                0.04 *
                                scaleFactor, // Scale font size
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: innerConstraints.maxHeight * 0.05),
                        CustomInputField(
                          label: 'Email Address',
                          hintText: 'Enter your email',
                          controller: TextEditingController(),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: innerConstraints.maxHeight * 0.03),
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
                              fontSize: formWidth *
                                  0.03 *
                                  scaleFactor, // Scale font size
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: innerConstraints.maxHeight * 0.03),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'Or\nLog In with',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.leagueSpartan(
                                  color: Colors.black,
                                  fontSize: formWidth *
                                      0.03 *
                                      scaleFactor, // Scale font size
                                  fontWeight: FontWeight.w600,
                                  height:
                                      2.1 * scaleFactor, // Scale line height
                                ),
                              ),
                              SizedBox(
                                  height: innerConstraints.maxHeight *
                                      0.02 *
                                      scaleFactor), // Scale spacing
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildSocialIcon(
                                      "assets/images/google-icon-logo.svg",
                                      formWidth * scaleFactor),
                                  SizedBox(
                                      width: formWidth * 0.04 * scaleFactor),
                                  _buildSocialIcon(
                                      "assets/images/Facebook_icon.png",
                                      formWidth * scaleFactor),
                                  SizedBox(
                                      width: formWidth * 0.04 * scaleFactor),
                                  _buildSocialIcon(
                                      "assets/images/apple-logo.svg",
                                      formWidth * scaleFactor),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: innerConstraints.maxHeight *
                                0.02 *
                                scaleFactor), // Scale spacing
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
                                      fontSize: formWidth *
                                          0.03 *
                                          scaleFactor, // Scale font size
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: GoogleFonts.leagueSpartan(
                                      color: const Color(0xFF3A0F88),
                                      fontSize: formWidth *
                                          0.03 *
                                          scaleFactor, // Scale font size
                                      fontWeight: FontWeight.w600,
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
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String imageUrl, double cardWidth) {
    final iconSize = cardWidth * 0.03;

    if (imageUrl.endsWith('.svg')) {
      return Container(
        width: iconSize,
        height: iconSize,
        child: SvgPicture.asset(
          imageUrl,
          fit: BoxFit.contain,
        ),
      );
    } else {
      return Container(
        width: iconSize,
        height: iconSize,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
