import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'components/button.dart';
import 'components/custom_input_field.dart';
import 'components/social_login_section.dart';
import 'components/gradient_background.dart';
import 'components/atoms/custom_button.dart';
import 'components/atoms/atomic_text.dart';
import 'components/atoms/service_button.dart';
import 'components/molecules/style_item.dart';
import 'components/molecules/salon_item.dart';
import 'components/molecules/services_section.dart';
import 'components/organisms/styles_grid.dart';
import 'components/organisms/styles_section.dart';
import 'components/templates/home_template.dart';
import 'components/models/service_data.dart';
import 'screens/login_screen_refactored.dart';
import 'screens/login_screen_responsive.dart';
import 'screens/registration_screen_refactored.dart';
import 'screens/registration_screen_responsive.dart';
import 'screens/home_screen.dart';
import 'screens/home_screen_desktop.dart';
import 'mobile_preview.dart';
import 'test_svg.dart';

void main() {
  runApp(const WidgetbookApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Braiding Nairobi - Responsive',
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
      home: const ResponsiveHomePage(),
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
            WidgetbookFolder(
              name: 'Atoms',
              children: [
                WidgetbookComponent(
                  name: 'AtomicButton',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Primary',
                      builder: (context) => Center(
                        child: AtomicButton(
                          text: 'Primary Button',
                          onPressed: () {},
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Secondary',
                      builder: (context) => Center(
                        child: AtomicButton(
                          text: 'Secondary Button',
                          isPrimary: false,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Small Primary',
                      builder: (context) => Center(
                        child: AtomicButton(
                          text: 'Small Primary',
                          isSmall: true,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Small Secondary',
                      builder: (context) => Center(
                        child: AtomicButton(
                          text: 'Small Secondary',
                          isPrimary: false,
                          isSmall: true,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'With Left Icon',
                      builder: (context) => Center(
                        child: AtomicButton(
                          text: 'With Icon',
                          icon: Icons.favorite,
                          iconPosition: AtomicIconPosition.left,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'With Right Icon',
                      builder: (context) => Center(
                        child: AtomicButton(
                          text: 'With Icon',
                          icon: Icons.arrow_forward,
                          iconPosition: AtomicIconPosition.right,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Active State',
                      builder: (context) => Center(
                        child: AtomicButton(
                          text: 'Active Button',
                          active: true,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'AtomicText',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Heading 1',
                      builder: (context) => const Center(
                        child: AtomicText.heading1('Heading 1 Text'),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Heading 2',
                      builder: (context) => const Center(
                        child: AtomicText.heading2('Heading 2 Text'),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Body Text',
                      builder: (context) => const Center(
                        child: AtomicText.body(
                            'This is body text with a longer sentence to show how it wraps.'),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Caption',
                      builder: (context) => const Center(
                        child: AtomicText.caption('This is caption text'),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Custom Style',
                      builder: (context) => const Center(
                        child: AtomicText(
                          'Custom styled text',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF7F38FF),
                        ),
                      ),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'ServiceButton',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Primary - Inactive',
                      builder: (context) => const Center(
                        child: ServiceButton(
                          text: 'Book a New Look',
                          imageUrl: 'https://placehold.co/19x19',
                          isPrimary: true,
                          isActive: false,
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Primary - Active',
                      builder: (context) => const Center(
                        child: ServiceButton(
                          text: 'Book a New Look',
                          imageUrl: 'https://placehold.co/19x19',
                          isPrimary: true,
                          isActive: true,
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Secondary - Inactive',
                      builder: (context) => const Center(
                        child: ServiceButton(
                          text: 'Book Braids Removal',
                          isPrimary: false,
                          iconData: Icons.close_rounded,
                          isActive: false,
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Secondary - Active',
                      builder: (context) => const Center(
                        child: ServiceButton(
                          text: 'Book Braids Removal',
                          isPrimary: false,
                          iconData: Icons.close_rounded,
                          isActive: true,
                        ),
                      ),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'StyleItem',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Interactive Style Item',
                      builder: (context) {
                        final isActive = context.knobs.boolean(
                          label: 'Is Active',
                          description: 'Whether the style item is selected',
                          initialValue: false,
                        );
                        final styleName = context.knobs.list(
                          label: 'Style Name',
                          options: ['Braids', 'Locs', 'Twists', 'Lines'],
                          initialOption: 'Braids',
                        );
                        final imageUrl = context.knobs.list(
                          label: 'Image URL',
                          options: [
                            'https://placehold.co/102x102/7F38FF/FFFFFF?text=Braids',
                            'https://placehold.co/102x102/8B5CF6/FFFFFF?text=Locs',
                            'https://placehold.co/102x102/A855F7/FFFFFF?text=Twists',
                            'https://placehold.co/102x102/C084FC/FFFFFF?text=Lines',
                          ],
                          initialOption:
                              'https://placehold.co/102x102/7F38FF/FFFFFF?text=Braids',
                        );

                        return Center(
                          child: StyleItem(
                            imageUrl: imageUrl,
                            name: styleName,
                            isActive: isActive,
                            onTap: () {
                              // Show a snackbar to indicate tap
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Tapped on $styleName'),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'Molecules',
              children: [
                WidgetbookComponent(
                  name: 'SalonItem',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Interactive Salon Item',
                      builder: (context) {
                        final salonName = context.knobs.string(
                          label: 'Salon Name',
                          description: 'Name of the salon',
                          initialValue: "Doris' Salon - Stall 222",
                        );
                        final styleName = context.knobs.string(
                          label: 'Style Name',
                          description: 'Name of the style',
                          initialValue: 'Bob Braids',
                        );
                        final price = context.knobs.string(
                          label: 'Price',
                          description: 'Price of the service',
                          initialValue: '1500 KES',
                        );
                        final imageUrl = context.knobs.list(
                          label: 'Image URL',
                          options: [
                            'assets/images/icon-background.png',
                          ],
                          initialOption: 'assets/images/icon-background.png',
                        );

                        return Center(
                          child: GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Tapped on $salonName'),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                            child: Container(
                              width: 400,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8F6FC),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color(0xFFF8F5FF),
                                        border: Border.all(
                                          color: const Color(0xFFE0D5FF),
                                          width: 2,
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                          imageUrl,
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF8F5FF),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.store,
                                                color: Color(0xFF7F38FF),
                                                size: 24,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 4),
                                        Text(
                                          salonName,
                                          style: GoogleFonts.leagueSpartan(
                                            color: const Color(0xFF332749),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          styleName,
                                          style: GoogleFonts.leagueSpartan(
                                            color: const Color(0xFF332749),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          price,
                                          style: GoogleFonts.leagueSpartan(
                                            color: const Color(0xFF332749),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'ServicesSection',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Interactive Services Section',
                      builder: (context) {
                        final activeButton = context.knobs.list(
                          label: 'Active Button',
                          options: [
                            'Book a New Look',
                            'Book Braids Removal',
                            'None',
                          ],
                          initialOption: 'Book a New Look',
                        );

                        final isAppointmentActive =
                            activeButton == 'Book a New Look';
                        final isRemovalActive =
                            activeButton == 'Book Braids Removal';

                        return ServicesSection(
                          isAppointmentActive: isAppointmentActive,
                          isRemovalActive: isRemovalActive,
                        );
                      },
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'SvgTest',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'SVG Loading Test',
                      builder: (context) => const SvgTestWidget(),
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'Organisms',
              children: [
                WidgetbookComponent(
                  name: 'StylesGrid',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Interactive Styles Grid',
                      builder: (context) {
                        final selectedIndex = context.knobs.list(
                          label: 'Selected Style',
                          options: [
                            'None',
                            'Braids (0)',
                            'Locs (1)',
                            'Twists (2)',
                            'Lines (3)'
                          ],
                          initialOption: 'None',
                        );

                        int? getSelectedIndex() {
                          switch (selectedIndex) {
                            case 'None':
                              return null;
                            case 'Braids (0)':
                              return 0;
                            case 'Locs (1)':
                              return 1;
                            case 'Twists (2)':
                              return 2;
                            case 'Lines (3)':
                              return 3;
                            default:
                              return null;
                          }
                        }

                        return StylesGrid(
                          styles: const [
                            StyleData(
                              imageUrl: "assets/images/Braids.png",
                              name: "Braids",
                            ),
                            StyleData(
                              imageUrl: "assets/images/Locs.png",
                              name: "Locs",
                            ),
                            StyleData(
                              imageUrl: "assets/images/Twists.png",
                              name: "Twists",
                            ),
                            StyleData(
                              imageUrl: "assets/images/Lines.png",
                              name: "Lines",
                            ),
                            StyleData(
                              imageUrl: "assets/images/Weaves.png",
                              name: "Weaves",
                            ),
                            StyleData(
                              imageUrl: "assets/images/Maintenance.png",
                              name: "Maintenance",
                            ),
                          ],
                          selectedIndex: getSelectedIndex(),
                          onStyleSelected: null,
                        );
                      },
                    ),
                    WidgetbookUseCase(
                      name: 'Styles Grid - No Selection',
                      builder: (context) => const StylesGrid(
                        styles: [
                          StyleData(
                            imageUrl:
                                "https://placehold.co/102x102/7F38FF/FFFFFF?text=Braids",
                            name: "Braids",
                          ),
                          StyleData(
                            imageUrl:
                                "https://placehold.co/102x102/8B5CF6/FFFFFF?text=Locs",
                            name: "Locs",
                          ),
                          StyleData(
                            imageUrl:
                                "https://placehold.co/102x102/A855F7/FFFFFF?text=Twists",
                            name: "Twists",
                          ),
                          StyleData(
                            imageUrl: "assets/images/Lines.png",
                            name: "Lines",
                          ),
                        ],
                        selectedIndex: null,
                        onStyleSelected: null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'Templates',
              children: [
                WidgetbookComponent(
                  name: 'HomeTemplate',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Desktop Template with Full Data',
                      builder: (context) => HomeTemplate(
                        styles: const [
                          StyleData(
                            imageUrl: "assets/images/Braids.png",
                            name: "Braids",
                          ),
                          StyleData(
                            imageUrl: "assets/images/Locs.png",
                            name: "Locs",
                          ),
                          StyleData(
                            imageUrl: "assets/images/Twists.png",
                            name: "Twists",
                          ),
                          StyleData(
                            imageUrl:
                                "https://placehold.co/102x102/C084FC/FFFFFF?text=Lines",
                            name: "Lines",
                          ),
                          StyleData(
                            imageUrl: "assets/images/Weaves.png",
                            name: "Weaves",
                          ),
                          StyleData(
                            imageUrl: "assets/images/Maintenance.png",
                            name: "Maintenance",
                          ),
                        ],
                        services: const [
                          ServiceButtonData(
                            text: "Book a New Look",
                            imageUrl: "https://placehold.co/19x19",
                            isPrimary: true,
                          ),
                          ServiceButtonData(
                            text: "Book Braids Removal",
                            isPrimary: false,
                            iconData: Icons.close_rounded,
                          ),
                        ],
                        salons: const [
                          SalonData(
                            imageUrl: "assets/images/icon-background.png",
                            name: "Doris' Salon - Stall 222",
                            style: "Bob Braids",
                            price: "1500 KES",
                          ),
                          SalonData(
                            imageUrl: "assets/images/icon-background.png",
                            name: "Linet's Salon - Stall 10",
                            style: "Twist Braids",
                            price: "2300 KES",
                          ),
                          SalonData(
                            imageUrl: "assets/images/icon-background.png",
                            name: "Maggy's Salon - Stall 321",
                            style: "Box Braids",
                            price: "2000 KES",
                          ),
                          SalonData(
                            imageUrl: "assets/images/icon-background.png",
                            name: "Connie's Salon - Stall 55",
                            style: "Bob Braids",
                            price: "1500 KES",
                          ),
                          SalonData(
                            imageUrl: "assets/images/icon-background.png",
                            name: "Sarah's Salon - Stall 123",
                            style: "Cornrow Braids",
                            price: "1800 KES",
                          ),
                          SalonData(
                            imageUrl: "assets/images/icon-background.png",
                            name: "Grace's Salon - Stall 456",
                            style: "Fulani Braids",
                            price: "2500 KES",
                          ),
                          SalonData(
                            imageUrl: "assets/images/icon-background.png",
                            name: "Mary's Salon - Stall 789",
                            style: "Ghana Braids",
                            price: "2200 KES",
                          ),
                          SalonData(
                            imageUrl: "assets/images/icon-background.png",
                            name: "Jane's Salon - Stall 101",
                            style: "Senegalese Twists",
                            price: "2800 KES",
                          ),
                          SalonData(
                            imageUrl: "assets/images/icon-background.png",
                            name: "Ann's Salon - Stall 202",
                            style: "Micro Braids",
                            price: "3200 KES",
                          ),
                          SalonData(
                            imageUrl: "assets/images/icon-background.png",
                            name: "Rose's Salon - Stall 303",
                            style: "Knotless Braids",
                            price: "3500 KES",
                          ),
                          SalonData(
                            imageUrl: "assets/images/icon-background.png",
                            name: "Faith's Salon - Stall 404",
                            style: "Passion Twists",
                            price: "2400 KES",
                          ),
                          SalonData(
                            imageUrl: "assets/images/icon-background.png",
                            name: "Hope's Salon - Stall 505",
                            style: "Box Braids",
                            price: "2100 KES",
                          ),
                        ],
                        onBookAppointment: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
            WidgetbookComponent(
              name: 'RegistrationScreen',
              useCases: [
                WidgetbookUseCase(
                  name: 'Mobile Registration',
                  builder: (context) => const RegistrationScreenRefactored(),
                ),
                WidgetbookUseCase(
                  name: 'Desktop Registration',
                  builder: (context) => const RegistrationScreenResponsive(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'HomeScreen',
              useCases: [
                WidgetbookUseCase(
                  name: 'Desktop Home Screen',
                  builder: (context) => const DesktopHomePage(),
                ),
                WidgetbookUseCase(
                  name: 'Mobile Home Screen',
                  builder: (context) => const NewHomePage(),
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

// Responsive wrapper that chooses between mobile and desktop layouts
class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use mobile preview for screens narrower than 768px
        if (constraints.maxWidth < 768) {
          return const MobileHomePreview();
        } else {
          return const DesktopHomePage();
        }
      },
    );
  }
}
