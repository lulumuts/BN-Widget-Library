import 'package:flutter/material.dart';

class ServiceButtonData {
  final String text;
  final String? imageUrl;
  final IconData? iconData;
  final bool isPrimary;

  const ServiceButtonData({
    required this.text,
    this.imageUrl,
    this.iconData,
    this.isPrimary = true,
  });
}

class StyleData {
  final String imageUrl;
  final String name;

  const StyleData({
    required this.imageUrl,
    required this.name,
  });
}

class SalonData {
  final String imageUrl;
  final String name;
  final String style;
  final String price;

  const SalonData({
    required this.imageUrl,
    required this.name,
    required this.style,
    required this.price,
  });
}
