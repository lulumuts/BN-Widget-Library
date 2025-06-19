import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        // "Or Log In with" text
        Text(
          'Or \nLog In with',
          textAlign: TextAlign.center,
          style: GoogleFonts.leagueSpartan(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 2.22,
          ),
        ),
        const SizedBox(height: 40),

        // Social media icons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon(
              imageUrl: "https://placehold.co/36x35",
              onTap: onGoogleTap,
            ),
            const SizedBox(width: 22),
            _buildSocialIcon(
              imageUrl: "https://placehold.co/36x31",
              onTap: onFacebookTap,
            ),
            const SizedBox(width: 22),
            _buildSocialIcon(
              imageUrl: "https://placehold.co/35x29",
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
