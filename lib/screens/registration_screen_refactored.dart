import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/custom_input_field.dart';
import '../components/button.dart';
import '../components/social_login_section.dart';
import '../components/gradient_background.dart';

class RegistrationScreenRefactored extends StatefulWidget {
  const RegistrationScreenRefactored({super.key});

  @override
  State<RegistrationScreenRefactored> createState() =>
      _RegistrationScreenRefactoredState();
}

class _RegistrationScreenRefactoredState
    extends State<RegistrationScreenRefactored> {
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
                                center: Alignment(0.006, 2.1),
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
                                "assets/images/Registration_bg.png",
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
                                Text('Welcome!',
                                    style: GoogleFonts.leagueSpartan(
                                        color: const Color(0xFF332749),
                                        fontSize: 40,
                                        fontWeight: FontWeight.w700)),
                                // const SizedBox(height: 8),
                                Text('Create your account below',
                                    style: GoogleFonts.leagueSpartan(
                                        color: const Color(0xFF332749),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 30),
                                CustomInputField(
                                    label: 'Full Name',
                                    hintText: 'Enter your full name',
                                    controller: _fullNameController,
                                    keyboardType: TextInputType.name),
                                const SizedBox(height: 10),
                                CustomInputField(
                                    label: 'Email Address',
                                    hintText: 'Enter your email',
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress),
                                const SizedBox(height: 10),
                                CustomInputField(
                                    label: 'Password',
                                    hintText: 'Enter your password',
                                    isPassword: true,
                                    controller: _passwordController),
                                const SizedBox(height: 10),
                                CustomInputField(
                                    label: 'Confirm Password',
                                    hintText: 'Confirm your password',
                                    isPassword: true,
                                    controller: _confirmPasswordController),
                                const SizedBox(height: 30),
                                SizedBox(
                                    width: double.infinity,
                                    child: CustomButton(
                                        text: 'Sign Up',
                                        onPressed: _handleSignUp,
                                        isPrimary: true)),
                                const SizedBox(height: 16),
                                GestureDetector(
                                  onTap: _handleSignIn,
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Already have an account? ",
                                              style: GoogleFonts.leagueSpartan(
                                                  color:
                                                      const Color(0xFF332749),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600)),
                                          TextSpan(
                                              text: 'Sign In',
                                              style: GoogleFonts.leagueSpartan(
                                                  color:
                                                      const Color(0xFF332749),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  decoration: TextDecoration
                                                      .underline)),
                                        ],
                                      ),
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

  void _handleSignUp() {
    print('Sign up pressed');
  }

  void _handleGoogleLogin() {
    print('Google login pressed');
  }

  void _handleFacebookLogin() {
    print('Facebook login pressed');
  }

  void _handleAppleLogin() {
    print('Apple login pressed');
  }

  void _handleSignIn() {
    print('Sign in pressed');
  }
}
