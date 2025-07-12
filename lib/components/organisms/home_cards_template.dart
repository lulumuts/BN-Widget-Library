import 'package:flutter/material.dart';

class HomeCardsTemplate extends StatelessWidget {
  final List<String> cardImages;
  const HomeCardsTemplate({super.key, required this.cardImages});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        double containerWidth;
        double containerHeight;
        EdgeInsets padding;

        if (screenWidth > 1800) {
          containerWidth = screenWidth * 0.35;
          padding = const EdgeInsets.symmetric(horizontal: 56, vertical: 40);
        } else if (screenWidth > 1400) {
          containerWidth = screenWidth * 0.4;
          padding = const EdgeInsets.symmetric(horizontal: 48, vertical: 36);
        } else if (screenWidth > 1200) {
          containerWidth = screenWidth * 0.45;
          padding = const EdgeInsets.symmetric(horizontal: 40, vertical: 32);
        } else if (screenWidth > 1000) {
          containerWidth = screenWidth * 0.5;
          padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 28);
        } else {
          containerWidth = screenWidth * 0.55;
          padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 24);
        }

        if (screenHeight > 1200) {
          containerHeight = screenHeight * 0.7;
        } else if (screenHeight > 1000) {
          containerHeight = screenHeight * 0.7;
        } else if (screenHeight > 800) {
          containerHeight = screenHeight * 0.7;
        } else if (screenHeight > 600) {
          containerHeight = screenHeight * 0.7;
        } else {
          containerHeight = screenHeight * 0.7;
        }
        containerWidth = containerWidth.clamp(350.0, 800.0);
        containerHeight = containerHeight.clamp(400.0, 1000.0);

        return Container(
          width: containerWidth,
          height: containerHeight,
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: const Color(0xFFEEE4FF),
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x267F38FF),
                blurRadius: 23,
                offset: Offset(0, 4),
                spreadRadius: 6,
              )
            ],
          ),
          child: Scrollbar(
            child: GridView.builder(
              itemCount: cardImages.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: 2.0, // width/height ratio
              ),
              itemBuilder: (context, index) {
                return _ImageCard(imagePath: cardImages[index]);
              },
            ),
          ),
        );
      },
    );
  }
}

class _ImageCard extends StatelessWidget {
  final String imagePath;
  const _ImageCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 180,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.2),
              height: 180,
            ),
          ),
        ],
      ),
    );
  }
}
