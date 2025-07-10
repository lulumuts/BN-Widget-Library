import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/atoms/custom_input_field.dart';
import '../components/atoms/custom_button.dart';
import '../components/atoms/social_login_section.dart';
import '../components/atoms/gradient_background.dart';

class OnboardingScreenMobile extends StatefulWidget {
  const OnboardingScreenMobile({super.key});

  @override
  State<OnboardingScreenMobile> createState() => _OnboardingScreenMobileState();
}

class _OnboardingScreenMobileState extends State<OnboardingScreenMobile> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // This Stack is the root of our layout. It allows layering.
          return Stack(
            fit: StackFit.expand,
            children: [
              // LAYER 1: The Fixed Background. This is the correct place for it.
              SingleChildScrollView(
                child: ConstrainedBox(
                  // This forces the content to be AT LEAST as tall as the screen.
                  // This is what makes the background visible for the full height.
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    children: [
                      // This SizedBox acts as a spacer for the area above the white card.
                      SizedBox(
                        height: 208,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // The purple radial gradient sits inside the spacer.
                            Positioned(
                              top: 30,
                              child: GradientBackground(
                                center: const Alignment(0.006, 2.1),
                                child: Container(
                                  width: constraints.maxWidth,
                                  height: 250,
                                  decoration: const ShapeDecoration(
                                      shape: OvalBorder()),
                                ),
                              ),
                            ),
                            // The logo sits on top of the gradient.
                            Positioned.fill(
                              child: Image.asset(
                                "assets/images/icon-background.png",
                                fit: BoxFit.none,
                                height: constraints.maxHeight * 0.01,
                              ),
                            ),
                            Positioned(
                              top: 103.95,
                              child: SvgPicture.asset(
                                "assets/images/BN_LOGO.svg",
                                width: 59.80,
                                height: 65.17,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // This is the white card with the form.
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(40, 50, 40, 50),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                          border: Border(
                              top: BorderSide(
                                  width: 1, color: Color(0xFFDECCFF))),
                        ),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 500),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Welcome to Braiding Nairobi!',
                                    style: GoogleFonts.leagueSpartan(
                                        color: const Color(0xFF332749),
                                        fontSize: 40,
                                        fontWeight: FontWeight.w700)),
                                // const SizedBox(height: 8),
                                Text('Let\'s get you started with your account',
                                    style: GoogleFonts.leagueSpartan(
                                        color: const Color(0xFF332749),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 30),
                                // Placeholder for form content
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'Onboarding Form Content\n(To be implemented)',
                                      style: GoogleFonts.leagueSpartan(
                                        color: const Color(0xFF332749),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
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
        },
      ),
    );
  }

  void _handleOnboarding() {
    // TODO: Implement onboarding logic
    print('Onboarding completed');
  }

  void _handleSkip() {
    // TODO: Implement skip logic
    print('Onboarding skipped');
  }
}
