import 'package:flutter/material.dart';
import '../../components/organisms/order_status_list_view.dart';
import '../../components/atoms/bottom_nav_icon_button.dart';

class OrdersScreenMobile extends StatelessWidget {
  const OrdersScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Mobile content - simplified for orders
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                child: const Center(
                  child: OrderStatusListView(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: const Color(0xFFEEE4FF),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HomeIconButton(
            isActive: false,
            onTap: () {},
          ),
          SalonsIconButton(
            isActive: false,
            onTap: () {},
          ),
          ChatIconButton(
            isActive: false,
            onTap: () {},
          ),
          OrdersIconButton(
            isActive: true,
            onTap: () {},
          ),
          ProfileIconButton(
            isActive: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
