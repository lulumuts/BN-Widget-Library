import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginSection extends StatelessWidget {
  final VoidCallback? onGoogleTap;
  final VoidCallback? onFacebookTap;
  final VoidCallback? onAppleTap;
  final double iconSize;
  final double? fontSize;

  const SocialLoginSection({
    super.key,
    this.onGoogleTap,
    this.onFacebookTap,
    this.onAppleTap,
    this.iconSize = 30.0,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        // "Or Log In with" text
        Text(
          'Or \nLog In with',
          textAlign: TextAlign.center,
          style: GoogleFonts.leagueSpartan(
            color: Colors.black,
            fontSize: fontSize ?? 18,
            fontWeight: FontWeight.w500,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 8),

        // Social media icons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon(
              imageUrl: "images/google-icon-logo.svg",
              onTap: onGoogleTap,
            ),
            const SizedBox(width: 20),
            _buildSocialIcon(
              imageUrl: "images/Facebook_icon.png",
              onTap: onFacebookTap,
            ),
            const SizedBox(width: 20),
            _buildSocialIcon(
              imageUrl: "images/apple-logo.svg",
              onTap: onAppleTap,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon({
    required String imageUrl,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: iconSize,
        height: iconSize,
        child: imageUrl.endsWith('.svg')
            ? SvgPicture.asset(
                imageUrl,
                fit: BoxFit.contain,
              )
            : Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
