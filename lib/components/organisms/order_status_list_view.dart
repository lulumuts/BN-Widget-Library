import 'package:flutter/material.dart';
import '../atoms/order_card.dart';
import '../atoms/atomic_button.dart';

class OrderStatusListView extends StatelessWidget {
  const OrderStatusListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for demonstration
    final List<_OrderData> orders = [
      _OrderData(
        title: 'Booking Confirmed',
        description:
            'We\'ve received your request and are preparing the next steps.',
        status: OrderStatus.completed,
      ),
      _OrderData(
        title: 'Looking for a Braider',
        description:
            'We\'re matching you with the right braider based on your order.',
        status: OrderStatus.ongoing,
      ),
      _OrderData(
        title: 'Braider Accepted',
        description:
            'Your braider has accepted the booking and is preparing for your appointment.',
        status: OrderStatus.pending,
      ),
      _OrderData(
        title: 'Braider Enroute',
        description:
            'Your braider is on the way! Sit tight, they\'ll be with you soon.',
        status: OrderStatus.pending,
      ),
      _OrderData(
        title: 'Braider Arrived',
        description:
            'Your braider has arrived! Feel free to message them directly through the app.',
        status: OrderStatus.pending,
      ),
      _OrderData(
        title: 'Service in Session',
        description:
            'Your appointment is in progress. Relax and enjoy the experience!',
        status: OrderStatus.pending,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final containerWidth = constraints.maxWidth;
        final screenWidth = MediaQuery.of(context).size.width;
        final isDesktop = screenWidth >= 800;
        final cardWidth = containerWidth - 60; // 30px padding on each side
        final cardHeight = isDesktop ? 90.5 : 124.0;
        final cardSpacing = 12.0;
        final leftPadding = isDesktop ? 13.0 : 24.0;

        final orderListWidth = isDesktop ? 800.0 : containerWidth;

        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: orderListWidth,
                height: orders.length * (cardHeight + cardSpacing) + 20,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: leftPadding), // Responsive left margin
                  child: Stack(
                    children: [
                      for (int i = 0; i < orders.length; i++)
                        Positioned(
                          left: (containerWidth - cardWidth) / 2,
                          top: i * (cardHeight + cardSpacing),
                          child: SizedBox(
                            width: cardWidth,
                            height: cardHeight,
                            child: OrderCard(
                              title: orders[i].title,
                              description: orders[i].description,
                              status: orders[i].status,
                            ),
                          ),
                        ),
                      for (int i = 0; i < orders.length; i++)
                        Positioned(
                          left: ((containerWidth - cardWidth) / 2) - 30,
                          top: i * (cardHeight + cardSpacing),
                          child: _OrderStatusPill(
                            status: orders[i].status,
                            height: cardHeight,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: AtomicButton(
                    text: 'Chat with Braider',
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _OrderData {
  final String title;
  final String description;
  final OrderStatus status;

  _OrderData({
    required this.title,
    required this.description,
    required this.status,
  });
}

class _OrderStatusPill extends StatelessWidget {
  final OrderStatus status;
  final double height;

  const _OrderStatusPill({required this.status, required this.height});

  Color get _pillColor {
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
        return 2.5;
      case OrderStatus.ongoing:
        return 2.5;
      case OrderStatus.pending:
        return 2.5;
    }
  }

  bool get _isFilled {
    return status == OrderStatus.completed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 13.49,
      height: height,
      decoration: ShapeDecoration(
        color: _isFilled ? _pillColor : Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: _borderWidth,
            color: _pillColor.withOpacity(1.0), // Always full opacity
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
