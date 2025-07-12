import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'onboarding_screen_mobile.dart';
import '../components/organisms/location.dart';

enum LocationView { view1, view2, view3 }

class LocationScreenDesktop extends StatelessWidget {
  final OnboardingView view;
  const LocationScreenDesktop({super.key, this.view = OnboardingView.view1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Desktop Location Screen',
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
          // Use OnboardingScreenMobile for screens narrower than 600px
          if (constraints.maxWidth < 600) {
            return const OnboardingScreenMobile();
          }
          return _buildDesktopLayout(context, constraints);
        },
      ),
    );
  }

  double _calculateFontSize(
      BoxConstraints constraints, double minSize, double maxSize) {
    const minWidth = 800;
    const maxWidth = 1300;
    final currentWidth = constraints.maxWidth.clamp(minWidth, maxWidth);
    final t = (currentWidth - minWidth) / (maxWidth - minWidth);
    return minSize + t * (maxSize - minSize);
  }

  Widget _buildDesktopLayout(BuildContext context, BoxConstraints constraints) {
    const cardWidth = 1287.0;
    const cardHeight = 856.79;
    var aspectRatio = cardWidth / cardHeight;
    if (constraints.maxWidth < 1300) {
      aspectRatio = 1.35;
    }
    double actualWidth = cardWidth;
    double actualHeight = cardWidth / aspectRatio;
    if (constraints.maxHeight > 1100) {
      actualHeight = constraints.maxHeight * 0.8;
      actualWidth = actualHeight * aspectRatio;
    }
    if (constraints.maxWidth < actualWidth + 40) {
      actualWidth = constraints.maxWidth - 40;
      actualHeight = actualHeight * aspectRatio;
    }
    if (constraints.maxHeight < actualHeight + 40) {
      actualHeight = constraints.maxHeight - 40;
      actualWidth = actualHeight * aspectRatio;
    }
    final scaleFactor = actualWidth / cardWidth;
    final titleSize = _calculateFontSize(constraints, 32, 40);
    final subtitleSize = _calculateFontSize(constraints, 18, 24);
    final bodySize = _calculateFontSize(constraints, 16, 18);
    final socialTextSize = _calculateFontSize(constraints, 16, 18);

    return Center(
      child: Container(
        width: actualWidth,
        height: actualHeight,
        padding: EdgeInsets.all(60.0 * scaleFactor),
        child: LayoutBuilder(
          builder: (context, innerConstraints) {
            double containerWidth = innerConstraints.maxWidth;
            double imageWidth = containerWidth * 0.4;
            double formWidth = containerWidth * 0.6;
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
                    width: 1 * scaleFactor,
                    color: const Color(0x0C7F38FF),
                  ),
                  borderRadius: BorderRadius.circular(24 * scaleFactor),
                ),
                shadows: [
                  BoxShadow(
                    color: const Color(0x417F38FF),
                    blurRadius: 25 * scaleFactor,
                    offset: Offset(0, 4 * scaleFactor),
                    spreadRadius: 13 * scaleFactor,
                  )
                ],
              ),
              child: Stack(
                children: [
                  Container(
                    width: imageWidth,
                    height: innerConstraints.maxHeight,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xBFE9DDFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24 * scaleFactor),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            "assets/images/Onboarding.png",
                            fit: BoxFit.cover,
                          ),
                        ),
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
                  Positioned(
                    right: 0,
                    top: 0,
                    child: SizedBox(
                      width: formWidth,
                      height: innerConstraints.maxHeight,
                      child: LocationScreen(view: view),
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
