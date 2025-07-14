import 'package:flutter/material.dart';

class BraiderStatusListView extends StatelessWidget {
  const BraiderStatusListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for demonstration
    final List<_StatusCardData> cards = [
      _StatusCardData(
        status: 'Booking Confirmed',
        description:
            'We’ve received your request and are preparing the next steps.',
        color: const Color(0xFF7F38FF),
        borderColor: const Color(0xFF7F38FF),
        borderWidth: 1,
        textColor: Colors.white,
        isFilled: true,
      ),
      _StatusCardData(
        status: 'Looking for a Braider',
        description:
            'We’re matching you with the right braider based on your order.',
        color: Colors.transparent,
        borderColor: const Color(0xFF7F38FF),
        borderWidth: 3,
        textColor: const Color(0xFF7F38FF),
        isFilled: false,
      ),
      _StatusCardData(
        status: 'Braider Accepted',
        description:
            'Your braider has accepted the booking and is preparing for your appointment.',
        color: Colors.transparent,
        borderColor: const Color(0xFFE7E3ED),
        borderWidth: 3,
        textColor: const Color(0xBF9484B1),
        isFilled: false,
      ),
      _StatusCardData(
        status: 'Braider Enroute',
        description:
            'Your braider is on the way! Sit tight, they’ll be with you soon.',
        color: Colors.transparent,
        borderColor: const Color(0xFFE7E3ED),
        borderWidth: 2,
        textColor: const Color(0xBF9484B1),
        isFilled: false,
      ),
      _StatusCardData(
        status: 'Braider Arrived',
        description:
            'Your braider has arrived! Feel free to message them directly through the app.',
        color: Colors.transparent,
        borderColor: const Color(0xFFE7E3ED),
        borderWidth: 2,
        textColor: const Color(0xBF9484B1),
        isFilled: false,
      ),
      _StatusCardData(
        status: 'Service in Session',
        description:
            'Your appointment is in progress. \nRelax and enjoy the experience!',
        color: Colors.transparent,
        borderColor: const Color(0xFFE7E3ED),
        borderWidth: 2,
        textColor: const Color(0xBF9484B1),
        isFilled: false,
      ),
      _StatusCardData(
        status: 'Service ended',
        description:
            'Your session is complete. We hope you love your new look!',
        color: Colors.transparent,
        borderColor: const Color(0xFFE7E3ED),
        borderWidth: 2,
        textColor: const Color(0xBF9484B1),
        isFilled: false,
      ),
    ];

    return SizedBox(
      width: 364.15,
      height: 735.89,
      child: Stack(
        children: [
          for (int i = 0; i < cards.length; i++)
            Positioned(
              left: 29.98,
              top: i * 106.77,
              child: _StatusCard(card: cards[i]),
            ),
          for (int i = 0; i < cards.length; i++)
            Positioned(
              left: 0,
              top: i * 106.35,
              child: _StatusCardBar(card: cards[i]),
            ),
        ],
      ),
    );
  }
}

class _StatusCardData {
  final String status;
  final String description;
  final Color color;
  final Color borderColor;
  final double borderWidth;
  final Color textColor;
  final bool isFilled;
  _StatusCardData({
    required this.status,
    required this.description,
    required this.color,
    required this.borderColor,
    required this.borderWidth,
    required this.textColor,
    required this.isFilled,
  });
}

class _StatusCard extends StatelessWidget {
  final _StatusCardData card;
  const _StatusCard({required this.card});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 332.82,
      height: 95.11,
      decoration: ShapeDecoration(
        color: card.isFilled ? card.color : Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: card.borderWidth, color: card.borderColor),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, top: 19, right: 16, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              card.status,
              style: TextStyle(
                color: card.textColor,
                fontSize: 20,
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w500,
                height: 0.80,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              card.description,
              style: TextStyle(
                color: card.textColor.withOpacity(card.isFilled ? 1 : 0.7),
                fontSize: 14,
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w300,
                height: 1.43,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusCardBar extends StatelessWidget {
  final _StatusCardData card;
  const _StatusCardBar({required this.card});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 13.49,
      height: 95.11,
      decoration: ShapeDecoration(
        color: card.isFilled ? card.borderColor : Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 2.5,
              color: card.borderColor.withOpacity(card.isFilled ? 1 : 0.5)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
