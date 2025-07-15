import 'package:flutter/material.dart';

enum OrderStatus { completed, ongoing, pending }

class OrderCard extends StatelessWidget {
  final String title;
  final String description;
  final OrderStatus status;

  const OrderCard({
    super.key,
    required this.title,
    required this.description,
    required this.status,
  });

  Color get _borderColor {
    switch (status) {
      case OrderStatus.completed:
        return const Color(0xFF7F38FF);
      case OrderStatus.ongoing:
        return const Color(0xFF7F38FF);
      case OrderStatus.pending:
        return const Color(0xFFE7E3ED);
    }
  }

  double get _borderWidth {
    switch (status) {
      case OrderStatus.completed:
        return 1;
      case OrderStatus.ongoing:
        return 3;
      case OrderStatus.pending:
        return 2;
    }
  }

  Color get _backgroundColor {
    switch (status) {
      case OrderStatus.completed:
        return const Color(0xFF7F38FF);
      default:
        return Colors.transparent;
    }
  }

  Color get _titleColor {
    switch (status) {
      case OrderStatus.completed:
        return Colors.white;
      case OrderStatus.ongoing:
        return const Color(0xFF7F38FF);
      case OrderStatus.pending:
        return const Color(0xBF9484B1);
    }
  }

  Color get _descColor {
    switch (status) {
      case OrderStatus.completed:
        return Colors.white;
      case OrderStatus.ongoing:
        return const Color(0xFF7F38FF);
      case OrderStatus.pending:
        return const Color(0xFFAFA3C4);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 800;
    final cardHeight = isDesktop ? 90.0 : 120.0;
    final titleFontSize = isDesktop ? 18.0 : 22.0;
    final descFontSize = isDesktop ? 13.0 : 16.0;

    final padding = isDesktop
        ? const EdgeInsets.only(left: 24, right: 16, top: 4, bottom: 4)
        : const EdgeInsets.only(left: 24, right: 16, top: 8, bottom: 8);

    return Container(
      width: 332.82,
      height: cardHeight,
      decoration: ShapeDecoration(
        color: _backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: _borderWidth, color: _borderColor),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  color: _titleColor,
                  fontSize: titleFontSize,
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w500,
                  height: 0.80,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: Text(
                description,
                style: TextStyle(
                  color: _descColor,
                  fontSize: descFontSize,
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w300,
                  height: 1.43,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
