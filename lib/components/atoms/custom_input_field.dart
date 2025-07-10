import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          label,
          style: GoogleFonts.leagueSpartan(
            color: const Color(0xBF481F94),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.0,
          ),
        ),
        const SizedBox(height: 8),

        // Input field - now full width
        Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: const Color(0xFFF8F4FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            obscureText: isPassword,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: GoogleFonts.leagueSpartan(
                color: const Color(0xBF481F94),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            style: GoogleFonts.leagueSpartan(
              color: const Color(0xFF332749),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
