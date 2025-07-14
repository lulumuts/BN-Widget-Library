import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/atoms/custom_input_field.dart';
import 'components/atoms/social_login_section.dart';
import 'components/atoms/gradient_background.dart';
import 'components/atoms/atomic_button.dart';
import 'components/atoms/atomic_text.dart';
import 'components/atoms/service_button.dart';
import 'components/atoms/bottom_nav_icon_button.dart';
import 'components/molecules/style_item.dart';
import 'components/molecules/services_section.dart';
import 'components/molecules/salon_card.dart';
import 'components/organisms/styles_grid.dart';
import 'components/templates/home_template.dart';
import 'components/templates/salons_template.dart';
import 'components/models/service_data.dart';
import 'screens/login_screen_refactored.dart';
import 'screens/login_screen_responsive.dart';
import 'screens/registration_screen_refactored.dart';
import 'screens/registration_screen_responsive.dart';
import 'screens/home_screen.dart';
import 'screens/home_screen_desktop.dart';
import 'screens/braider_screen_desktop.dart';
import 'screens/onboarding_screen_desktop.dart';
import 'screens/onboarding_screen_mobile.dart';
import 'mobile_preview.dart';

import 'components/organisms/home_cards_template.dart';
import 'screens/mobile_salon_screen.dart';
import 'components/atoms/rating_stars.dart';
import 'components/organisms/right_container.dart';
import 'components/organisms/onboarding_questions.dart';
import 'components/organisms/location.dart' as location;
import 'screens/location_screen_desktop.dart';
import 'components/organisms/braider_status_list_view.dart';
import 'components/atoms/order_card.dart';
import 'components/organisms/order_status_list_view.dart';
import 'screens/orders_screen_desktop.dart';

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
                            'assets/images/Lines-button.png',
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
                  name: 'GradientBackground',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Centered Gradient Background',
                      builder: (context) => const SizedBox(
                        width: 600,
                        height: 400,
                        child: GradientBackground(
                          center: Alignment(0.0, 0.0),
                          radius: 1.0,
                          child: Center(
                            child: Text(
                              'Centered Gradient Background',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
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
                  name: 'RatingStars',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Interactive Rating Stars',
                      builder: (context) {
                        final filledStars = context.knobs.list(
                          label: 'Filled Stars',
                          options: ['0', '1', '2', '3', '4', '5'],
                          initialOption: '0',
                        );
                        return Center(
                          child: RatingStars(
                            filledStars: int.parse(filledStars),
                            size: 32,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'ProfileIconButton',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default State',
                      builder: (context) {
                        final isActive = context.knobs.boolean(
                          label: 'Is Active',
                          initialValue: false,
                        );
                        return Center(
                          child: ProfileIconButton(
                            isActive: isActive,
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'HomeIconButton',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default State',
                      builder: (context) {
                        final isActive = context.knobs.boolean(
                          label: 'Is Active',
                          initialValue: false,
                        );
                        return Center(
                          child: HomeIconButton(
                            isActive: isActive,
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'SalonsIconButton',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default State',
                      builder: (context) {
                        final isActive = context.knobs.boolean(
                          label: 'Is Active',
                          initialValue: false,
                        );
                        return Center(
                          child: SalonsIconButton(
                            isActive: isActive,
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'ChatIconButton',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default State',
                      builder: (context) {
                        final isActive = context.knobs.boolean(
                          label: 'Is Active',
                          initialValue: false,
                        );
                        return Center(
                          child: ChatIconButton(
                            isActive: isActive,
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'OrdersIconButton',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default State',
                      builder: (context) {
                        final isActive = context.knobs.boolean(
                          label: 'Is Active',
                          initialValue: false,
                        );
                        return Center(
                          child: OrdersIconButton(
                            isActive: isActive,
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'OrderCard',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Completed',
                      builder: (context) => Center(
                        child: OrderCard(
                          title: 'Completed Order',
                          description: 'This order has been completed.',
                          status: OrderStatus.completed,
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Ongoing',
                      builder: (context) => Center(
                        child: OrderCard(
                          title: 'Ongoing Order',
                          description: 'This order is in progress.',
                          status: OrderStatus.ongoing,
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Pending',
                      builder: (context) => Center(
                        child: OrderCard(
                          title: 'Pending Order',
                          description: 'This order is pending.',
                          status: OrderStatus.pending,
                        ),
                      ),
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

                        return LayoutBuilder(
                          builder: (context, constraints) {
                            return Center(
                              child: SizedBox(
                                height: constraints.maxHeight *
                                    0.1, // 10% of screen height
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
                                    padding: const EdgeInsets.all(
                                        8), // Reduced padding
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF8F6FC),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center, // Changed to center
                                      children: [
                                        SizedBox(
                                          width: 50, // Reduced size
                                          height: 50, // Reduced size
                                          child: Container(
                                            width: 50,
                                            height: 50,
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
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color(0xFFF8F5FF),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: const Icon(
                                                      Icons.store,
                                                      color: Color(0xFF7F38FF),
                                                      size:
                                                          20, // Reduced icon size
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                            width: 12), // Reduced spacing
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center, // Center vertically
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                salonName,
                                                style:
                                                    GoogleFonts.leagueSpartan(
                                                  color:
                                                      const Color(0xFF332749),
                                                  fontSize:
                                                      12, // Reduced font size
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                  height: 2), // Reduced spacing
                                              Text(
                                                styleName,
                                                style:
                                                    GoogleFonts.leagueSpartan(
                                                  color:
                                                      const Color(0xFF332749),
                                                  fontSize:
                                                      11, // Reduced font size
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                  height: 2), // Reduced spacing
                                              Text(
                                                price,
                                                style:
                                                    GoogleFonts.leagueSpartan(
                                                  color:
                                                      const Color(0xFF332749),
                                                  fontSize:
                                                      11, // Reduced font size
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
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
                  name: 'SalonCard',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Interactive Salon Card',
                      builder: (context) {
                        final salonName = context.knobs.string(
                          label: 'Salon Name',
                          description: 'Name of the salon',
                          initialValue: "Cathy's Salon",
                        );
                        final imageUrl = context.knobs.list(
                          label: 'Image URL',
                          options: [
                            'None',
                            'assets/images/Weekly_Feature.png',
                            'assets/images/Beyond_the_chair.png',
                            'assets/images/Profile_notification.png',
                          ],
                          initialOption: 'None',
                        );

                        return Center(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final maxCardWidth = constraints.maxWidth * 0.2;
                              return ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: maxCardWidth,
                                ),
                                child: AspectRatio(
                                  aspectRatio: 168.28 / 220,
                                  child: SalonCard(
                                    salonName: salonName,
                                    imageUrl:
                                        imageUrl == 'None' ? null : imageUrl,
                                    onReadStory: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('Read story for $salonName'),
                                          duration: const Duration(seconds: 1),
                                        ),
                                      );
                                    },
                                    onBookNow: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('Book now for $salonName'),
                                          duration: const Duration(seconds: 1),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'RatingStars',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Interactive Rating Stars',
                      builder: (context) {
                        final filledStars = context.knobs.list(
                          label: 'Filled Stars',
                          options: ['0', '1', '2', '3', '4', '5'],
                          initialOption: '0',
                        );
                        return Center(
                          child: RatingStars(
                            filledStars: int.parse(filledStars),
                            size: 32,
                          ),
                        );
                      },
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
                              imageUrl: "assets/images/Braids-button.png",
                              name: "Braids",
                            ),
                            StyleData(
                              imageUrl: "assets/images/Locs-button.png",
                              name: "Locs",
                            ),
                            StyleData(
                              imageUrl: "assets/images/Twists-button.png",
                              name: "Twists",
                            ),
                            StyleData(
                              imageUrl: "assets/images/Lines-button.png",
                              name: "Lines",
                            ),
                            StyleData(
                              imageUrl: "assets/images/Weaves-button.png",
                              name: "Weaves",
                            ),
                            StyleData(
                              imageUrl: "assets/images/Maintenance-button.png",
                              name: "Natural",
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
                            imageUrl: "assets/images/Lines-button.png",
                            name: "Lines",
                          ),
                        ],
                        selectedIndex: null,
                        onStyleSelected: null,
                      ),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'HomeCardsTemplate',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Scrollable Cards Grid',
                      builder: (context) => HomeCardsTemplate(
                        cardImages: [
                          'assets/images/Weekly_Feature.png',
                          'assets/images/LinesBackground.png',
                          'assets/images/TwistsBackground.png',
                          'assets/images/LocsBackground.png',
                          'assets/images/WeavesBackground.png',
                          'assets/images/MaintenanceBackground.png',
                        ],
                      ),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'RightContainer',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => RightContainer(
                        styles: const [
                          StyleData(
                            imageUrl: "assets/images/Braids-button.png",
                            name: "Braids",
                          ),
                          StyleData(
                            imageUrl: "assets/images/Locs-button.png",
                            name: "Locs",
                          ),
                          StyleData(
                            imageUrl: "assets/images/Twists-button.png",
                            name: "Twists",
                          ),
                          StyleData(
                            imageUrl: "assets/images/Lines-button.png",
                            name: "Lines",
                          ),
                          StyleData(
                            imageUrl: "assets/images/Weaves-button.png",
                            name: "Weaves",
                          ),
                          StyleData(
                            imageUrl: "assets/images/Maintenance-button.png",
                            name: "Natural",
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
                        selectedStyleIndex: null,
                        onStyleSelected: (_) {},
                      ),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'LocationScreen',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => location.LocationScreen(),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'BraiderStatusListView',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) =>
                          const Center(child: BraiderStatusListView()),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'OrderStatusListView',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) =>
                          const Center(child: OrderStatusListView()),
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
                            imageUrl: "assets/images/Braids-button.png",
                            name: "Braids",
                          ),
                          StyleData(
                            imageUrl: "assets/images/Locs-button.png",
                            name: "Locs",
                          ),
                          StyleData(
                            imageUrl: "assets/images/Twists-button.png",
                            name: "Twists",
                          ),
                          StyleData(
                            imageUrl: "assets/images/Lines-button.png",
                            name: "Lines",
                          ),
                          StyleData(
                            imageUrl: "assets/images/Weaves-button.png",
                            name: "Weaves",
                          ),
                          StyleData(
                            imageUrl: "assets/images/Maintenance-button.png",
                            name: "Natural",
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
                      ),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'BraiderTemplate',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => const BraiderTemplate(),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'SalonsTemplate',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Desktop Salons Template',
                      builder: (context) {
                        final leftOptions = [
                          'Braids',
                          'Lines',
                          'Twists',
                          'Locs',
                          'Weaves',
                          'Natural',
                        ];
                        final leftOption = context.knobs.list(
                          label: 'Left Container Option',
                          options: leftOptions,
                          initialOption: leftOptions[0],
                        );
                        final selectedIndex = leftOptions.indexOf(leftOption);
                        // Ensure we have a valid index
                        final safeIndex =
                            selectedIndex >= 0 ? selectedIndex : 0;
                        return SalonsTemplate(selectedLeftOption: safeIndex);
                      },
                    ),
                    WidgetbookUseCase(
                      name: 'Mobile Salons Template',
                      builder: (context) {
                        final leftOptions = [
                          'Braids',
                          'Lines',
                          'Twists',
                          'Locs',
                          'Weaves',
                          'Natural',
                        ];
                        final leftOption = context.knobs.list(
                          label: 'Left Container Option',
                          options: leftOptions,
                          initialOption: leftOptions[0],
                        );
                        final selectedIndex = leftOptions.indexOf(leftOption);
                        // Ensure we have a valid index
                        final safeIndex =
                            selectedIndex >= 0 ? selectedIndex : 0;
                        return MobileSalonScreen(selectedLeftOption: safeIndex);
                      },
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'LoginTemplate',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Desktop Login',
                      builder: (context) => const LoginScreenResponsive(),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'RegistrationTemplate',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Desktop Registration',
                      builder: (context) =>
                          const RegistrationScreenResponsive(),
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
                      builder: (context) =>
                          const RegistrationScreenRefactored(),
                    ),
                    WidgetbookUseCase(
                      name: 'Desktop Registration',
                      builder: (context) =>
                          const RegistrationScreenResponsive(),
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
                WidgetbookComponent(
                  name: 'SalonsScreen',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Desktop Salons Screen',
                      builder: (context) {
                        final leftOptions = [
                          'Braids',
                          'Lines',
                          'Twists',
                          'Locs',
                          'Weaves',
                          'Natural',
                        ];
                        final leftOption = context.knobs.list(
                          label: 'Left Container Option',
                          options: leftOptions,
                          initialOption: leftOptions[0],
                        );
                        final selectedIndex = leftOptions.indexOf(leftOption);
                        // Ensure we have a valid index
                        final safeIndex =
                            selectedIndex >= 0 ? selectedIndex : 0;
                        return SalonsTemplate(selectedLeftOption: safeIndex);
                      },
                    ),
                    WidgetbookUseCase(
                      name: 'Mobile Salons Screen',
                      builder: (context) {
                        final leftOptions = [
                          'Braids',
                          'Lines',
                          'Twists',
                          'Locs',
                          'Weaves',
                          'Natural',
                        ];
                        final leftOption = context.knobs.list(
                          label: 'Left Container Option',
                          options: leftOptions,
                          initialOption: leftOptions[0],
                        );
                        final selectedIndex = leftOptions.indexOf(leftOption);
                        // Ensure we have a valid index
                        final safeIndex =
                            selectedIndex >= 0 ? selectedIndex : 0;
                        return MobileSalonScreen(selectedLeftOption: safeIndex);
                      },
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'BraiderScreen',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Desktop',
                      builder: (context) {
                        final viewType = context.knobs.list(
                          label: 'Right Content',
                          options: [
                            'Styles & Salons',
                            'Detailed Style View',
                          ],
                          initialOption: 'Styles & Salons',
                        );
                        return BraiderTemplate(rightContentOption: viewType);
                      },
                    ),
                    WidgetbookUseCase(
                      name: 'Mobile',
                      builder: (context) => const MobileBraiderPreview(),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'OnboardingScreen',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Desktop Onboarding',
                      builder: (context) {
                        final view = context.knobs.list(
                          label: 'Onboarding View',
                          options: [
                            'View 1',
                            'View 2',
                            'View 3',
                          ],
                          initialOption: 'View 1',
                        );
                        OnboardingView selectedView;
                        switch (view) {
                          case 'View 2':
                            selectedView = OnboardingView.view2;
                            break;
                          case 'View 3':
                            selectedView = OnboardingView.view3;
                            break;
                          case 'View 1':
                          default:
                            selectedView = OnboardingView.view1;
                        }
                        return OnboardingScreenDesktop(view: selectedView);
                      },
                    ),
                    WidgetbookUseCase(
                      name: 'Mobile Onboarding',
                      builder: (context) {
                        final view = context.knobs.list(
                          label: 'Onboarding View',
                          options: [
                            'View 1',
                            'View 2',
                            'View 3',
                          ],
                          initialOption: 'View 1',
                        );
                        OnboardingView selectedView;
                        switch (view) {
                          case 'View 2':
                            selectedView = OnboardingView.view2;
                            break;
                          case 'View 3':
                            selectedView = OnboardingView.view3;
                            break;
                          case 'View 1':
                          default:
                            selectedView = OnboardingView.view1;
                        }
                        return OnboardingScreenMobile(view: selectedView);
                      },
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'LocationScreenDesktop',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Desktop Location',
                      builder: (context) {
                        final view = context.knobs.list(
                          label: 'Location View',
                          options: [
                            'View 1',
                            'View 2',
                            'View 3',
                          ],
                          initialOption: 'View 1',
                        );
                        location.OnboardingView selectedView;
                        switch (view) {
                          case 'View 2':
                            selectedView = location.OnboardingView.view2;
                            break;
                          case 'View 3':
                            selectedView = location.OnboardingView.view3;
                            break;
                          case 'View 1':
                          default:
                            selectedView = location.OnboardingView.view1;
                        }
                        return LocationScreenDesktop(view: selectedView);
                      },
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'OrdersScreenDesktop',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => const OrdersScreenDesktop(),
                    ),
                  ],
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

class _DesktopSalonListItem extends StatelessWidget {
  final SalonData salon;

  const _DesktopSalonListItem({required this.salon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                salon.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF8F5FF),
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
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  salon.name,
                  style: GoogleFonts.leagueSpartan(
                    color: const Color(0xFF332749),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  salon.style,
                  style: GoogleFonts.leagueSpartan(
                    color: const Color(0xFF332749),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  salon.price,
                  style: GoogleFonts.leagueSpartan(
                    color: const Color(0xFF332749),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                RatingStars(
                  filledStars: 5,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
