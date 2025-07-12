import 'package:flutter/material.dart';
import '../atoms/gradient_background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../atoms/custom_input_field.dart';

enum OnboardingView { view1, view2, view3 }

class LocationScreen extends StatelessWidget {
  final OnboardingView view;
  const LocationScreen({super.key, this.view = OnboardingView.view1});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final containerWidth = isMobile ? double.infinity : 428.0;
    final gradientWidth = 800.0;
    final gradientHeight = isMobile ? 1000.0 : 1000.0;
    return Container(
      width: containerWidth,
      height: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Stack(
          children: [
            if (view == OnboardingView.view1 ||
                view == OnboardingView.view2) ...[
              // SVG background only, no gradient
              Positioned.fill(
                child: Center(
                  child: SizedBox(
                    width: gradientWidth,
                    height: 1000.0,
                    child: Opacity(
                      opacity: 0.3,
                      child: SvgPicture.asset(
                        'assets/images/icon-background.svg',
                        width: gradientWidth,
                        height: 800.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            if (view == OnboardingView.view3) ...[
              // SVG background for view 3
              Positioned.fill(
                child: Center(
                  child: SizedBox(
                    width: gradientWidth,
                    height: 1000.0,
                    child: Opacity(
                      opacity: 0.3,
                      child: SvgPicture.asset(
                        'assets/images/icon-background.svg',
                        width: gradientWidth,
                        height: 800.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            // Remove the Positioned for the text blocks and center them
            Center(
              child: () {
                switch (view) {
                  case OnboardingView.view1:
                    return Container(
                      width: 305,
                      height: 633.20,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 3.76,
                            top: 120,
                            child: SizedBox(
                              width: 300.59,
                              height: 300,
                              child: Text(
                                'To get you looking your best, we need your location.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF3A0F88),
                                  fontSize: 22,
                                  fontFamily: 'League Spartan',
                                  fontWeight: FontWeight.w600,
                                  height: 1.25,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 5.38,
                            top: 200,
                            child: SizedBox(
                              width: 274.36,
                              child: Text(
                                'We’ll use this send our braider to you when you book your appointments',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF3A0F88),
                                  fontSize: 18,
                                  fontFamily: 'League Spartan',
                                  fontWeight: FontWeight.w300,
                                  height: 1.33,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 42.5,
                            top: 520.20,
                            child: Container(
                              width: 220,
                              height: 40,
                              decoration: ShapeDecoration(
                                color: Color(0xFF332749),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 42.5,
                            top: 519.20,
                            child: SizedBox(
                              width: 220,
                              height: 40,
                              child: Center(
                                child: Text(
                                  'Allow Location Access',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'League Spartan',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 110,
                            top: 300,
                            child: SizedBox(
                              width: 80,
                              height: 140,
                              child: SvgPicture.asset(
                                'assets/icons/Location Icon.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 18,
                            top: 570.20,
                            child: SizedBox(
                              width: 265,
                              height: 34,
                              child: Center(
                                child: Text(
                                  'Enter Location Manually',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF332749),
                                    fontSize: 16,
                                    fontFamily: 'League Spartan',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 46.56,
                            top: 278.70,
                            child: Container(
                              width: 192,
                              height: 192,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                          ),
                        ],
                      ),
                    );
                  case OnboardingView.view2:
                    return Container(
                      width: 350,
                      height: 682.12,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 8.03,
                            top: 133.92,
                            child: SizedBox(
                              width: 321.67,
                              height: 260,
                              child: Text(
                                'Search for your location below or, use your current location to proceed',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF3A0F88),
                                  fontSize: 22,
                                  fontFamily: 'League Spartan',
                                  fontWeight: FontWeight.w400,
                                  height:
                                      1.5, // <-- Increase this value for more line height
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 20,
                            child: Center(
                              child: SizedBox(
                                width: 80,
                                height: 80,
                                child: SvgPicture.asset(
                                  'assets/icons/Location Icon.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 632.12,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                width: 200,
                                height: 40,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: const Color(0xFF3A0F88),
                                    ),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 632.12,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: SizedBox(
                                width: 200,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    'Use this Location',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF3A0F88),
                                      fontSize: 14,
                                      fontFamily: 'League Spartan',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 236.83,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: SizedBox(
                                width: 268.76,
                                child: CustomInputField(
                                  label: '',
                                  hintText: 'Enter your location',
                                  outline: false,
                                  prefixIcon: Icon(Icons.search,
                                      color: Color(0xFF3A0F88)),
                                  // Custom bold style for location only
                                  textStyle: const TextStyle(
                                    color: Color(0xFF332749),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 462.12,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                width: 250,
                                height: 40,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF332749),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: const Color(0xFF3A0F88),
                                    ),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 462.12,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: SizedBox(
                                width: 250,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    'Use my current location',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'League Spartan',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 163.50,
                            top: 400.89,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Or',
                                  style: TextStyle(
                                    color: const Color(0xFF3A0F88),
                                    fontSize: 20,
                                    fontFamily: 'League Spartan',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 24),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 340.23,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                width: 250,
                                height: 40,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF332749),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 340.23,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: SizedBox(
                                width: 250,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    'Search',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'League Spartan',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 126.58,
                            top: 0,
                            child: Container(
                              width: 89,
                              height: 89,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(),
                            ),
                          ),
                        ],
                      ),
                    );
                  case OnboardingView.view3:
                    return Column(
                      children: [
                        const SizedBox(height: 40),
                        Center(
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: SvgPicture.asset(
                              'assets/icons/Location Icon.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Center(
                          child: SizedBox(
                            width: 260,
                            child: Text(
                              'Please enter your address details below',
                              style: TextStyle(
                                color: Color(0xFF3A0F88),
                                fontSize: 20,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            children: [
                              CustomInputField(
                                label: 'Building Name',
                                hintText: 'Enter your building name',
                              ),
                              const SizedBox(height: 20),
                              CustomInputField(
                                label: 'Floor Number',
                                hintText: 'Enter your floor number',
                              ),
                              const SizedBox(height: 20),
                              CustomInputField(
                                label: 'Door Number',
                                hintText: 'Enter your door number',
                              ),
                              const SizedBox(height: 20),
                              CustomInputField(
                                label: 'Additional Information',
                                hintText: 'Enter any additional information',
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 24.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF332749),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                textStyle: const TextStyle(
                                  fontFamily: 'League Spartan',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              child: const Text('Submit'),
                            ),
                          ),
                        ),
                      ],
                    );
                }
              }(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: view == OnboardingView.view3 ||
                      view == OnboardingView.view1
                  ? const SizedBox.shrink()
                  : view == OnboardingView.view2
                      ? const SizedBox.shrink() // Remove buttons for View 2
                      : Padding(
                          padding:
                              const EdgeInsets.only(bottom: 32.0, right: 32.0),
                          child: ElevatedButton(
                            onPressed: () {}, // TODO: Add your onPressed logic
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                if (states.contains(MaterialState.hovered) ||
                                    states.contains(MaterialState.pressed)) {
                                  return const Color(0xFF7F38FF);
                                }
                                return const Color(0xFF332749);
                              }),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                              ),
                              elevation: MaterialStateProperty.all(2),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'LeagueSpartan',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing:
                                        1.2, // Adjust this value as needed
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.chevron_right,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
            ),
            Positioned(
              left: 363.24,
              top: 861,
              child: Container(
                width: 24,
                height: 24,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: const Stack(),
              ),
            ),
            Positioned(
              left: -40.34,
              top: 54.33,
              child: Container(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0)
                  ..rotateZ(-0.63),
                width: 130.53,
                height: 130.53,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: const Stack(),
              ),
            ),
            Positioned(
              left: 331.80,
              top: 427.10,
              child: Container(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0)
                  ..rotateZ(-0.75),
                width: 130.53,
                height: 130.53,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: const Stack(),
              ),
            ),
            Positioned(
              left: 102.90,
              top: 926,
              child: Container(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0)
                  ..rotateZ(3.14),
                width: 130.53,
                height: 130.53,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: const Stack(),
              ),
            ),
            Positioned(
              left: 343.63,
              top: 159.89,
              child: Container(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0)
                  ..rotateZ(-1.56),
                width: 130.53,
                height: 130.53,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: const Stack(),
              ),
            ),
            Positioned(
              left: 400.06,
              top: 782.25,
              child: Container(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0)
                  ..rotateZ(-0.02),
                width: 124.29,
                height: 124.29,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: const Stack(),
              ),
            ),
            Positioned(
              left: 151.89,
              top: 617.97,
              child: Container(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0)
                  ..rotateZ(-0.02),
                width: 124.29,
                height: 124.29,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: const Stack(),
              ),
            ),
            Positioned(
              left: 169.98,
              top: 157.76,
              child: Container(
                width: 130.53,
                height: 130.53,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: const Stack(),
              ),
            ),
            Positioned(
              left: -59.15,
              top: 382.06,
              child: Container(
                width: 130.53,
                height: 130.53,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: const Stack(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CustomDropdown for seamless, scrollable dropdown
class CustomDropdown extends StatefulWidget {
  const CustomDropdown({Key? key}) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool _isOpen = false;
  String? _selected;
  final List<String> _options =
      List<String>.generate(20, (i) => 'Option ${i + 1}');

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFF7F38FF);
    return SizedBox(
      width: 353,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Input field
          InkWell(
            onTap: () => setState(() => _isOpen = !_isOpen),
            borderRadius: BorderRadius.circular(24),
            child: Container(
              width: 353,
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 21),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: const BorderSide(color: borderColor, width: 1),
                  left: const BorderSide(color: borderColor, width: 1),
                  right: const BorderSide(color: borderColor, width: 1),
                  bottom: _isOpen
                      ? BorderSide.none
                      : const BorderSide(color: borderColor, width: 1),
                ),
                borderRadius: _isOpen
                    ? const BorderRadius.vertical(
                        top: Radius.circular(24), bottom: Radius.zero)
                    : BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selected ?? 'Select one answer',
                    style: const TextStyle(
                        fontSize: 16,
                        color: borderColor,
                        fontFamily: 'League Spartan'),
                  ),
                  AnimatedRotation(
                    turns: _isOpen ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: const Icon(Icons.expand_more,
                        size: 32, color: borderColor),
                  )
                ],
              ),
            ),
          ),
          // Dropdown menu
          if (_isOpen)
            Positioned(
              top: 56.0,
              left: 0,
              right: 0,
              child: Material(
                elevation: 2,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(24)),
                child: Container(
                  width: 353,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      left: const BorderSide(color: borderColor, width: 1),
                      right: const BorderSide(color: borderColor, width: 1),
                      bottom: const BorderSide(color: borderColor, width: 1),
                      top: BorderSide.none,
                    ),
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(24)),
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    children: _options
                        .map((option) => InkWell(
                              onTap: () {
                                setState(() {
                                  _selected = option;
                                  _isOpen = false;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 21),
                                child: Text(option,
                                    style: const TextStyle(
                                      color: borderColor,
                                      fontFamily: 'League Spartan',
                                    )),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// SimpleSelectInput example for experimentation
class SimpleSelectInput extends StatefulWidget {
  const SimpleSelectInput({super.key});

  @override
  State<SimpleSelectInput> createState() => _SimpleSelectInputState();
}

class _SimpleSelectInputState extends State<SimpleSelectInput> {
  final List<String> _options = ['Option 1', 'Option 2', 'Option 3'];
  String? _selected;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selected,
      hint: const Text('Select an option'),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      items: _options
          .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ))
          .toList(),
      onChanged: (value) {
        setState(() => _selected = value);
      },
    );
  }
}

// Placeholder for salon card
class _SalonCardPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: Color(0xFFF3EDFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFF7F38FF), width: 1),
      ),
      child: Center(
        child: Text(
          'Salon Card',
          style: TextStyle(
            color: Color(0xFF7F38FF),
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
