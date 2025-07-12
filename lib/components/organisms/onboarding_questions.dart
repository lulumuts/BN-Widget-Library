import 'package:flutter/material.dart';
import '../atoms/gradient_background.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum OnboardingView { view1, view2, view3 }

class OnboardingQuestions extends StatelessWidget {
  final OnboardingView view;
  const OnboardingQuestions({super.key, this.view = OnboardingView.view1});

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
      child: Stack(
        children: [
          if (view != OnboardingView.view3) ...[
            // SVG background (below gradient)
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
            // Centered gradient background using the component
            Positioned.fill(
              child: Center(
                child: SizedBox(
                  width: gradientWidth,
                  height: gradientHeight,
                  child: GradientBackground(
                    center: const Alignment(0.0, 0.0),
                    radius: 0.9,
                    colors: [
                      const Color(0x207F38FF),
                      const Color(0x209B5AFF),
                      const Color(0x20B77DFF),
                      const Color(0x20CBAEFF),
                      const Color(0x20DECCFF),
                      const Color(0x20EEE4FF),
                      Colors.white.withOpacity(0.0),
                      Colors.white,
                    ],
                    child: const SizedBox.expand(),
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
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          'We need to ask you a few questions about your routine first.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF7F38FF),
                            fontSize: 30,
                            fontFamily: 'LeagueSpartan',
                            fontWeight: FontWeight.w600,
                            height: 1.42,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: 250,
                        child: Text(
                          'This should only take a few minutes.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF7F38FF),
                            fontSize: 24,
                            fontFamily: 'LeagueSpartan',
                            fontWeight: FontWeight.w200,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  );
                case OnboardingView.view2:
                  return CustomDropdown();
                case OnboardingView.view3:
                  return Column(
                    children: [
                      // Top section with background and placeholder for text
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 32.0, left: 32.0, right: 32.0),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 16.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F0FF),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '🙌🏾',
                                style: TextStyle(fontSize: 48),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Yay, you’re all done!',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF332749),
                                  fontFamily: 'League Spartan',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'So what’s next?',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF332749),
                                  fontFamily: 'League Spartan',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 8),
                              Center(
                                child: SizedBox(
                                  width: 280,
                                  child: Text(
                                    'Stay on top of your hair journey with insights & progress tracking.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF332749),
                                      fontFamily: 'League Spartan',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: Color(0xFF332749), width: 2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                  ),
                                  child: Text(
                                    'Go to Home',
                                    style: TextStyle(
                                      fontFamily: 'League Spartan',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: Color(
                                          0xFF332749), // This sets the text color
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Text between top and bottom sections
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Additionally, here are some suggested salons\nbased on your answers',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF332749),
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // Bottom section with reduced height
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height:
                                  283.5, // Reduced height for 2 rows of 3, all cards visible
                              child: GridView.count(
                                crossAxisCount: 3,
                                shrinkWrap: true,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                                physics: NeverScrollableScrollPhysics(),
                                childAspectRatio:
                                    1.1, // Decrease this value for even taller cards (width / height)
                                children: List.generate(
                                    6, (index) => _SalonCardPlaceholder()),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF332749),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                ),
                                child: Text(
                                  'Browse More Salons',
                                  style: TextStyle(
                                    fontFamily: 'League Spartan',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
              }
            }(),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: view == OnboardingView.view3
                ? const SizedBox.shrink()
                : view == OnboardingView.view2
                    ? Padding(
                        padding: const EdgeInsets.only(
                            bottom: 32.0, left: 32.0, right: 32.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: Color(0xFF7F38FF), width: 2),
                                foregroundColor: const Color(0xFF7F38FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                              ),
                              child: const Text(
                                'Skip',
                                style: TextStyle(
                                  fontFamily: 'League Spartan',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Color(0xFF7F38FF),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed:
                                  () {}, // TODO: Add your onPressed logic
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
                          ],
                        ),
                      )
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
