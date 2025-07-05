import 'package:flutter/material.dart';
import '../components/components.dart';
import '../mobile_preview.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});

  // Sample data
  static final List<ServiceButtonData> _services = [
    const ServiceButtonData(
      text: "Book a New Look",
      imageUrl: "assets/images/braids_vector.svg",
      isPrimary: true,
    ),
    const ServiceButtonData(
      text: "Book Braids Removal",
      isPrimary: false,
      iconData: Icons.close_rounded,
    ),
  ];

  static final List<StyleData> _styles = [
    const StyleData(
      imageUrl: "assets/images/Braids-button.png",
      name: "Braids",
    ),
    const StyleData(
      imageUrl: "assets/images/Locs-button.png",
      name: "Locs",
    ),
    const StyleData(
      imageUrl: "assets/images/Twists-button.png",
      name: "Twists",
    ),
    const StyleData(
      imageUrl: "assets/images/Lines-button.png",
      name: "Lines",
    ),
    const StyleData(
      imageUrl: "assets/images/Weaves-button.png",
      name: "Weaves",
    ),
    const StyleData(
      imageUrl: "assets/images/Maintenance-button.png",
      name: "Natural",
    ),
  ];

  static final List<SalonData> _salons = [
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Doris' Salon - Stall 222",
      style: "Bob Braids",
      price: "1500 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Linet's Salon - Stall 10",
      style: "Twist Braids",
      price: "2300 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Maggy's Salon - Stall 321",
      style: "Box Braids",
      price: "2000 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Connie's Salon - Stall 55",
      style: "Bob Braids",
      price: "1500 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Sarah's Salon - Stall 123",
      style: "Cornrow Braids",
      price: "1800 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Grace's Salon - Stall 456",
      style: "Fulani Braids",
      price: "2500 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Mary's Salon - Stall 789",
      style: "Ghana Braids",
      price: "2200 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Jane's Salon - Stall 101",
      style: "Senegalese Twists",
      price: "2800 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Ann's Salon - Stall 202",
      style: "Micro Braids",
      price: "3200 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Rose's Salon - Stall 303",
      style: "Knotless Braids",
      price: "3500 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Faith's Salon - Stall 404",
      style: "Passion Twists",
      price: "2400 KES",
    ),
    const SalonData(
      imageUrl: "assets/images/icon-background.png",
      name: "Hope's Salon - Stall 505",
      style: "Box Braids",
      price: "2100 KES",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use mobile preview for screens narrower than 768px
        if (constraints.maxWidth < 768) {
          return const MobileHomePreview();
        }

        // Desktop version with responsive containers
        return HomeTemplate(
          styles: _styles,
          services: _services,
          salons: _salons,
          onBookAppointment: () {},
        );
      },
    );
  }
}
