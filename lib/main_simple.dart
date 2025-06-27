import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/molecules/services_section.dart';

void main() {
  runApp(const SimpleApp());
}

class SimpleApp extends StatelessWidget {
  const SimpleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Braiding Nairobi - Simple',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF332749),
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.leagueSpartanTextTheme(
          ThemeData(brightness: Brightness.light).textTheme,
        ),
      ),
      home: const SimpleHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SimpleHomePage extends StatelessWidget {
  const SimpleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Braiding Nairobi',
                style: GoogleFonts.leagueSpartan(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF332749),
                ),
              ),
              const SizedBox(height: 32),
              const ServicesSection(),
              const SizedBox(height: 32),
              const Text(
                'Widget Library Test',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF332749),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
