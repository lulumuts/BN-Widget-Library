import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginSection extends StatelessWidget {
  final VoidCallback? onGoogleTap;
  final VoidCallback? onFacebookTap;
  final VoidCallback? onAppleTap;

  const SocialLoginSection({
    super.key,
    this.onGoogleTap,
    this.onFacebookTap,
    this.onAppleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        // "Or Log In with" text
        Text(
          'Or \nLog In with',
          textAlign: TextAlign.center,
          style: GoogleFonts.leagueSpartan(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 15),

        // Social media icons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon(
              imageUrl: "assets/images/google-icon-logo.svg",
              onTap: onGoogleTap,
            ),
            const SizedBox(width: 22),
            _buildSocialIcon(
              imageUrl: "assets/images/Facebook_icon.png",
              onTap: onFacebookTap,
            ),
            const SizedBox(width: 22),
            _buildSocialIcon(
              imageUrl: "assets/images/apple-logo.svg",
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
      child: Container(
        width: 36,
        height: 35,
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
