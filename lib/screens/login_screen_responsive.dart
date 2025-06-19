import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/custom_input_field.dart';
import '../components/button.dart';
import '../components/social_login_section.dart';
import '../components/gradient_background.dart';

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
          // Use mobile layout for screens narrower than 768px
          if (constraints.maxWidth < 768) {
            return _buildMobileLayout(context, constraints);
          }
          return _buildDesktopLayout(context, constraints);
        },
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, BoxConstraints constraints) {
    return Stack(
      children: [
        // Background image centered horizontally
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          height: constraints.maxHeight * 0.3,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
        // Logo
        Positioned(
          left: 20,
          top: 20,
          child: Container(
            width: 60,
            height: 60,
            child: SvgPicture.asset(
              "assets/images/logo.svg",
              fit: BoxFit.contain,
            ),
          ),
        ),
        // Login form
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: constraints.maxHeight * 0.25),
                Text(
                  'Hello!',
                  style: GoogleFonts.leagueSpartan(
                    color: const Color(0xFF7F38FF),
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.60,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Please Sign in below',
                  style: GoogleFonts.leagueSpartan(
                    color: const Color(0xFF7F38FF),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  label: 'Email Address',
                  hintText: 'Enter your email',
                  controller: TextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  label: 'Password',
                  hintText: 'Enter your password',
                  isPassword: true,
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: 'Login',
                    onPressed: () {},
                    isPrimary: true,
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Forgot my password',
                    style: GoogleFonts.leagueSpartan(
                      color: const Color(0xFF332749),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Or\nLog In with',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.leagueSpartan(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 2.1,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialIcon("https://placehold.co/36x35", 500),
                          const SizedBox(width: 20),
                          _buildSocialIcon("https://placehold.co/36x31", 500),
                          const SizedBox(width: 20),
                          _buildSocialIcon("https://placehold.co/35x29", 500),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
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
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign Up',
                            style: GoogleFonts.leagueSpartan(
                              color: const Color(0xFF3A0F88),
                              fontSize: 16,
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
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context, BoxConstraints constraints) {
    // Define the card dimensions while maintaining aspect ratio
    final cardWidth = 1187.0;
    final cardHeight = 806.79;
    final aspectRatio = cardWidth / cardHeight;

    // Calculate the actual dimensions based on available space
    double actualWidth = cardWidth;
    double actualHeight = cardHeight;

    // If the screen is smaller than the desired width, scale down proportionally
    if (constraints.maxWidth < cardWidth + 120) {
      // 120px for padding
      actualWidth = constraints.maxWidth - 120;
      actualHeight = actualWidth / aspectRatio;
    }

    // If the screen is smaller than the desired height, scale down proportionally
    if (constraints.maxHeight < actualHeight + 120) {
      actualHeight = constraints.maxHeight - 120;
      actualWidth = actualHeight * aspectRatio;
    }

    return Center(
      child: Container(
        width: actualWidth,
        height: actualHeight,
        padding: const EdgeInsets.all(60.0),
        child: LayoutBuilder(
          builder: (context, innerConstraints) {
            // Calculate responsive widths
            double containerWidth = innerConstraints.maxWidth;
            double imageWidth = containerWidth * 0.4;
            double formWidth = containerWidth * 0.6;

            // If screen is large enough, use original proportions
            if (containerWidth > 1000) {
              imageWidth = containerWidth * 0.5;
              formWidth = containerWidth * 0.5;
            }

            return Container(
              width: containerWidth,
              height: innerConstraints.maxHeight,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: Color(0x0C7F38FF),
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x417F38FF),
                    blurRadius: 25,
                    offset: Offset(0, 4),
                    spreadRadius: 13,
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
                        borderRadius: BorderRadius.circular(24),
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
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(24),
                            bottomRight: Radius.circular(24),
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
                            fontSize: formWidth * 0.06,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.60,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Please Sign in below',
                          style: GoogleFonts.leagueSpartan(
                            color: const Color(0xFF7F38FF),
                            fontSize: formWidth * 0.04,
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
                              fontSize: formWidth * 0.03,
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
                                  fontSize: formWidth * 0.03,
                                  fontWeight: FontWeight.w600,
                                  height: 2.1,
                                ),
                              ),
                              SizedBox(
                                  height: innerConstraints.maxHeight * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildSocialIcon(
                                      "https://placehold.co/36x35", formWidth),
                                  SizedBox(width: formWidth * 0.04),
                                  _buildSocialIcon(
                                      "https://placehold.co/36x31", formWidth),
                                  SizedBox(width: formWidth * 0.04),
                                  _buildSocialIcon(
                                      "https://placehold.co/35x29", formWidth),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: innerConstraints.maxHeight * 0.02),
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
                                      fontSize: formWidth * 0.03,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: GoogleFonts.leagueSpartan(
                                      color: const Color(0xFF3A0F88),
                                      fontSize: formWidth * 0.03,
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
    return Container(
      width: cardWidth * 0.03,
      height: cardWidth * 0.03,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
