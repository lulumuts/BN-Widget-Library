import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          return SingleChildScrollView(
            child: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Stack(
                children: [
                  // Centered background gradient
                  Center(
                    child: GradientBackground(
                      child: Container(
                        width: constraints.maxWidth + 50,
                        height: constraints.maxHeight,
                        decoration: const ShapeDecoration(
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                  ),

                  // Decorative rotated containers (background elements)
                  _buildRotatedContainer(-40.34, 54.33, -0.63),
                  _buildRotatedContainer(346.67, 360.62, -0.75),
                  _buildRotatedContainer(105.26, 967.53, 3.14),
                  _buildRotatedContainer(343.63, 159.89, -1.56),
                  _buildRotatedContainer(340.50, 685.94, -0.02, size: 124.29),
                  _buildRotatedContainer(165.40, 217.02, 0.0),

                  // Main white container - now full width
                  Positioned(
                    left: 0,
                    top: 222.95,
                    child: Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight - 222.95,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xFFDECCFF),
                          ),
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                  ),

                  // Logo
                  Positioned(
                    left: constraints.maxWidth * 0.5 - 30,
                    top: 103.95,
                    child: Container(
                      width: 59.80,
                      height: 65.17,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://placehold.co/60x65"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  // Hello text
                  Positioned(
                    left: 44.84,
                    top: 279.95,
                    child: Text(
                      'Hello!',
                      style: GoogleFonts.leagueSpartan(
                        color: const Color(0xFF332749),
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.60,
                      ),
                    ),
                  ),

                  // Please Sign in below text
                  Positioned(
                    left: 42.95,
                    top: 328.07,
                    child: Text(
                      'Please Sign in below',
                      style: GoogleFonts.leagueSpartan(
                        color: const Color(0xFF332749),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Email input field
                  Positioned(
                    left: 40,
                    top: 405.04,
                    child: SizedBox(
                      width: constraints.maxWidth - 80,
                      child: CustomInputField(
                        label: 'Email Address',
                        hintText: 'Enter your email',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),

                  // Password input field
                  Positioned(
                    left: 40,
                    top: 489.04,
                    child: SizedBox(
                      width: constraints.maxWidth - 80,
                      child: CustomInputField(
                        label: 'Password',
                        hintText: 'Enter your password',
                        isPassword: true,
                        controller: _passwordController,
                      ),
                    ),
                  ),

                  // Login button
                  Positioned(
                    left: 40,
                    top: 611.97,
                    child: SizedBox(
                      width: constraints.maxWidth - 80,
                      child: CustomButton(
                        text: 'Login',
                        onPressed: _handleLogin,
                        isPrimary: true,
                      ),
                    ),
                  ),

                  // Forgot password text
                  Positioned(
                    left: 42.91,
                    top: 665.97,
                    child: GestureDetector(
                      onTap: _handleForgotPassword,
                      child: Text(
                        'Forgot my password',
                        style: GoogleFonts.leagueSpartan(
                          color: const Color(0xFF332749),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  // Social login section
                  Positioned(
                    left: constraints.maxWidth * 0.5 - 60,
                    top: 698.95,
                    child: SocialLoginSection(
                      onGoogleTap: _handleGoogleLogin,
                      onFacebookTap: _handleFacebookLogin,
                      onAppleTap: _handleAppleLogin,
                    ),
                  ),

                  // Don't have an account text
                  Positioned(
                    left: constraints.maxWidth * 0.5 - 100,
                    top: 837.38,
                    child: GestureDetector(
                      onTap: _handleSignUp,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: GoogleFonts.leagueSpartan(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign Up',
                              style: GoogleFonts.leagueSpartan(
                                color: const Color(0xFF3A0F88),
                                fontSize: 18,
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
          );
        },
      ),
    );
  }

  Widget _buildRotatedContainer(double left, double top, double rotation,
      {double size = 130.53}) {
    return Positioned(
      left: left,
      top: top,
      child: Transform.rotate(
        angle: rotation,
        child: Container(
          width: size,
          height: size,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: const Stack(),
        ),
      ),
    );
  }

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
