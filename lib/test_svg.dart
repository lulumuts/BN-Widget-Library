import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgTestWidget extends StatelessWidget {
  const SvgTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SVG Test'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Testing SVG Loading:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            // Test 1: Chevron down (should work)
            const Text('Test 1: Chevron Down (should work):'),
            const SizedBox(height: 10),
            SvgPicture.asset(
              'assets/images/chevron-down.svg',
              width: 50,
              height: 50,
              placeholderBuilder: (context) => const Icon(
                Icons.error,
                size: 50,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20),

            // Test 2: Braids vector with error handling
            const Text('Test 2: Braids Vector (with error handling):'),
            const SizedBox(height: 10),
            SvgPicture.asset(
              'assets/images/braids_vector.svg',
              width: 100,
              height: 100,
              placeholderBuilder: (context) => Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'SVG Failed to Load',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Test 2b: Braids vector2 with error handling
            const Text('Test 2b: Braids Vector2 (with error handling):'),
            const SizedBox(height: 10),
            SvgPicture.asset(
              'assets/images/braids_vector2.svg',
              width: 100,
              height: 100,
              placeholderBuilder: (context) => Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'SVG2 Failed to Load',
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Test 3: Try with different path
            const Text('Test 3: Braids Vector (different path):'),
            const SizedBox(height: 10),
            SvgPicture.asset(
              'widget_library/assets/images/braids_vector.svg',
              width: 100,
              height: 100,
              placeholderBuilder: (context) => Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Path Failed',
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Test 4: Try with network fallback
            const Text('Test 4: Network SVG test:'),
            const SizedBox(height: 10),
            SvgPicture.network(
              'https://raw.githubusercontent.com/flutter/website/main/examples/layout/responsive/_grid_placeholder.svg',
              width: 50,
              height: 50,
              placeholderBuilder: (context) => const Icon(
                Icons.error,
                size: 50,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),

            // Test 5: Simple icon as comparison
            const Text('Test 5: Material Icon (for comparison):'),
            const SizedBox(height: 10),
            const Icon(
              Icons.face,
              size: 50,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
