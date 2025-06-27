import 'package:flutter/material.dart';

class StylesButton extends StatelessWidget {
  const StylesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 102.24,
          height: 125.89,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Stack(
            children: [
              const Positioned(
                left: 26.87,
                top: 109.36,
                child: SizedBox(
                  width: 34.08,
                  height: 16.53,
                  child: Text(
                    'Locs',
                    style: TextStyle(
                      color: Color(0xFF332749),
                      fontSize: 16,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 102.24,
                  height: 99.19,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFC6BEB6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: -7.59,
                        top: 15,
                        child: Container(
                          width: 109.84,
                          height: 84.19,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  NetworkImage("https://placehold.co/110x84"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
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
