import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/custom_input_field.dart';
import '../components/button.dart';
import '../components/social_login_section.dart';
import '../components/gradient_background.dart';

class LoginScreenRefactored extends StatefulWidget {
  const LoginScreenRefactored({super.key});

  @override
  State<LoginScreenRefactored> createState() => _LoginScreenRefactoredState();
}

class _LoginScreenRefactoredState extends State<LoginScreenRefactored> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                                Text('Hello!',
                                    style: GoogleFonts.leagueSpartan(
                                        color: const Color(0xFF332749),
                                        fontSize: 40,
                                        fontWeight: FontWeight.w700)),
                                // const SizedBox(height: 8),
                                Text('Please Sign in below',
                                    style: GoogleFonts.leagueSpartan(
                                        color: const Color(0xFF332749),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 30),
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
                                const SizedBox(height: 30),
                                SizedBox(
                                    width: double.infinity,
                                    child: CustomButton(
                                        text: 'Login',
                                        onPressed: _handleLogin,
                                        isPrimary: true)),
                                const SizedBox(height: 16),
                                GestureDetector(
                                    onTap: _handleForgotPassword,
                                    child: Text('Forgot my password',
                                        style: GoogleFonts.leagueSpartan(
                                            color: const Color(0xFF332749),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500))),
                                const SocialLoginSection(iconSize: 28),
                                const SizedBox(height: 16),
                                GestureDetector(
                                  onTap: _handleSignUp,
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Don't have an account? ",
                                              style: GoogleFonts.leagueSpartan(
                                                  color:
                                                      const Color(0xFF332749),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600)),
                                          TextSpan(
                                              text: 'Sign Up',
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

  // NOTE: I am commenting out _buildRotatedContainer as it's no longer used in the new layout.
  // Widget _buildRotatedContainer(double left, double top, double rotation,
  //     {double size = 130.53}) {
  //   return Positioned(
  //     left: left,
  //     top: top,
  //     child: Transform.rotate(
  //       angle: rotation,
  //       child: Container(
  //         width: size,
  //         height: size,
  //         clipBehavior: Clip.antiAlias,
  //         decoration: const BoxDecoration(),
  //         child: const Stack(),
  //       ),
  //     ),
  //   );
  // }

  void _handleLogin() {
    print('Login pressed');
  }

  void _handleForgotPassword() {
    print('Forgot password pressed');
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

  void _handleSignUp() {
    print('Sign up pressed');
  }
}
