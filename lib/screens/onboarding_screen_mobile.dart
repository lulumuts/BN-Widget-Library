import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/atoms/gradient_background.dart';
import '../components/organisms/onboarding_questions.dart';

class OnboardingScreenMobile extends StatefulWidget {
  final OnboardingView view;
  const OnboardingScreenMobile({super.key, this.view = OnboardingView.view1});

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
      body: OnboardingQuestions(view: widget.view),
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
