import 'package:flutter/material.dart';

class Group289 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 279.77,
          height: 48.80,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 279.77,
                  height: 48.80,
                  decoration: ShapeDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 72.65,
                top: 4.15,
                child: SizedBox(
                  width: 184.22,
                  height: 41.85,
                  child: Text(
                    'Book a New Look',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w600,
                      height: 1.20,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 8.16,
                top: 4.15,
                child: Container(
                  width: 38.16,
                  height: 38.21,
                  decoration: ShapeDecoration(
                    color: const Color.fromARGB(255, 246, 186, 186),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(180),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 14.58,
                top: 9.50,
                child: Container(
                  width: 25.32,
                  height: 25.32,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/25x25"),
                      fit: BoxFit.cover,
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
}
