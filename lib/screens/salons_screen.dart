import 'package:flutter/material.dart';
import '../components/templates/salons_template.dart';
import 'mobile_salon_screen.dart';

class SalonsScreen extends StatelessWidget {
  const SalonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use mobile screen for screens narrower than 768px
        if (constraints.maxWidth < 768) {
          return const MobileSalonScreen();
        } else {
          return const SalonsTemplate();
        }
      },
    );
  }
}
