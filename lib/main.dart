import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/button.dart';
import 'components/custom_input_field.dart';
import 'components/social_login_section.dart';
import 'components/gradient_background.dart';
import 'screens/login_screen_refactored.dart';
import 'screens/login_screen_responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF332749),
          brightness: Brightness.light,
          primary: const Color(0xFF332749),
          onPrimary: Colors.white,
          primaryContainer: const Color(0xFF7F38FF),
          onPrimaryContainer: Colors.white,
          surface: Colors.white,
          onSurface: const Color(0xFF332749),
          surfaceVariant: const Color(0xFFF5F5F5),
          onSurfaceVariant: const Color(0xFF332749),
          outline: const Color(0xFF332749),
        ),
        textTheme: GoogleFonts.leagueSpartanTextTheme(
          ThemeData(brightness: Brightness.light).textTheme,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 1,
            shadowColor: Colors.transparent,
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF332749),
          brightness: Brightness.dark,
          primary: const Color(0xFF7F38FF),
          onPrimary: Colors.white,
          primaryContainer: const Color(0xFF332749),
          onPrimaryContainer: Colors.white,
          surface: const Color(0xFF1A1A1A),
          onSurface: Colors.white,
          surfaceVariant: const Color(0xFF2A2A2A),
          onSurfaceVariant: Colors.white,
          outline: const Color(0xFF7F38FF),
        ),
        textTheme: GoogleFonts.leagueSpartanTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
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
            WidgetbookComponent(
              name: 'CustomInputField',
              useCases: [
                WidgetbookUseCase(
                  name: 'Email Input',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(20),
                    child: CustomInputField(
                      label: 'Email Address',
                      hintText: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Password Input',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(20),
                    child: CustomInputField(
                      label: 'Password',
                      hintText: 'Enter your password',
                      isPassword: true,
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'SocialLoginSection',
              useCases: [
                WidgetbookUseCase(
                  name: 'Social Login',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(20),
                    child: SocialLoginSection(),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'GradientBackground',
              useCases: [
                WidgetbookUseCase(
                  name: 'Gradient Background',
                  builder: (context) => SizedBox(
                    width: 200,
                    height: 200,
                    child: GradientBackground(
                      child: const Center(
                        child: Text(
                          'Gradient Background',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          name: 'Screens',
          children: [
            WidgetbookComponent(
              name: 'LoginScreen',
              useCases: [
                WidgetbookUseCase(
                  name: 'Mobile Login',
                  builder: (context) => const LoginScreenRefactored(),
                ),
                WidgetbookUseCase(
                  name: 'Desktop Login',
                  builder: (context) => const LoginScreenResponsive(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// class Material3Showcase extends StatefulWidget {
//   const Material3Showcase({super.key});

//   @override
//   State<Material3Showcase> createState() => _Material3ShowcaseState();
// }

// class _Material3ShowcaseState extends State<Material3Showcase> {
//   bool _isDarkMode = false;

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: _isDarkMode
//           ? Theme.of(context).copyWith(
//               colorScheme: ColorScheme.fromSeed(
//                 seedColor: const Color(0xFF332749),
//                 brightness: Brightness.dark,
//               ),
//             )
//           : Theme.of(context).copyWith(
//               colorScheme: ColorScheme.fromSeed(
//                 seedColor: const Color(0xFF332749),
//                 brightness: Brightness.light,
//               ),
//             ),
//       child: Scaffold(
//         backgroundColor: Theme.of(context).colorScheme.surface,
//         body: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Material 3 Design System',
//                     style: GoogleFonts.leagueSpartan(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Theme.of(context).colorScheme.onSurface,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () => setState(() => _isDarkMode = !_isDarkMode),
//                     icon: Icon(
//                       _isDarkMode ? Icons.light_mode : Icons.dark_mode,
//                       color: Theme.of(context).colorScheme.onSurface,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 'Theme: ${_isDarkMode ? "Dark" : "Light"}',
//                 style: GoogleFonts.leagueSpartan(
//                   fontSize: 16,
//                   color: Theme.of(context).colorScheme.onSurfaceVariant,
//                 ),
//               ),
//               const SizedBox(height: 32),
//               Wrap(
//                 spacing: 16,
//                 runSpacing: 16,
//                 children: [
//                   CustomButton(
//                     text: 'Primary',
//                     onPressed: () {},
//                   ),
//                   CustomButton(
//                     text: 'Secondary',
//                     isPrimary: false,
//                     onPressed: () {},
//                   ),
//                   CustomButton(
//                     text: 'Small Primary',
//                     isSmall: true,
//                     onPressed: () {},
//                   ),
//                   CustomButton(
//                     text: 'Small Secondary',
//                     isPrimary: false,
//                     isSmall: true,
//                     onPressed: () {},
//                   ),
//                   CustomButton(
//                     text: 'With Icon',
//                     icon: Icons.favorite,
//                     onPressed: () {},
//                   ),
//                   CustomButton(
//                     text: 'Active State',
//                     active: true,
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
