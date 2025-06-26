import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MobilePreviewApp());
}

class MobilePreviewApp extends StatelessWidget {
  const MobilePreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Home Screen Preview',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7F38FF),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.leagueSpartanTextTheme(),
      ),
      home: const MobileHomePreview(),
    );
  }
}

class MobileHomePreview extends StatelessWidget {
  const MobileHomePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Home Screen Preview'),
        backgroundColor: const Color(0xFF7F38FF),
        foregroundColor: Colors.white,
      ),
      body: const NewHomePage(),
    );
  }
}
