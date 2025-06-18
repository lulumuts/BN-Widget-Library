import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.leagueSpartanTextTheme(),
      ),
      home: const WidgetbookApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: [
        WidgetbookFolder(
          name: 'Components',
          children: [
            WidgetbookComponent(
              name: 'CustomButton',
              useCases: [
                WidgetbookUseCase(
                  name: 'Primary',
                  builder: (context) => Center(
                    child: CustomButton(
                      text: 'Primary',
                      onPressed: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Secondary',
                  builder: (context) => Center(
                    child: CustomButton(
                      text: 'Secondary',
                      isPrimary: false,
                      onPressed: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Secondary with Icon',
                  builder: (context) => Center(
                    child: CustomButton(
                      text: 'Secondary',
                      isPrimary: false,
                      icon: Icons.chevron_right,
                      iconPosition: IconPosition.right,
                      onPressed: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Small',
                  builder: (context) => Center(
                    child: CustomButton(
                      text: 'Small',
                      isSmall: true,
                      onPressed: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Small Secondary',
                  builder: (context) => Center(
                    child: CustomButton(
                      text: 'Small Secondary',
                      isPrimary: false,
                      isSmall: true,
                      onPressed: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Active',
                  builder: (context) => Center(
                    child: CustomButton(
                      text: 'Active',
                      active: true,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
