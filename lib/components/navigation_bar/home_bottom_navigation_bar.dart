import 'package:flutter/material.dart';
import 'package:konkanspecials/view/homepage.dart';
import 'package:konkanspecials/view/orders.dart';
import 'package:konkanspecials/view/profile.dart';

import 'package:konkanspecials/viewmodel/home_bottom_navigation_bar_view_model.dart';
import 'package:provider/provider.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeBottomNavigationBarViewModel>(
        builder: (context, homeBottomNavigationBarViewModel, child) {
      return BottomNavigationBar(
        currentIndex: homeBottomNavigationBarViewModel.selectedItem.index,
        onTap: (index) {
          homeBottomNavigationBarViewModel
              .setSelectedItem(HomeBottomNavigationBarItem.values[index]);
        },
        items: HomeBottomNavigationBarItem.values
            .map((item) => BottomNavigationBarItem(
                icon: Icon(item.icon), label: item.label))
            .toList(),
      );
    });
  }
}

enum HomeBottomNavigationBarItem {
  homePage(screen: Homepage(), label: 'Home', icon: Icons.home),
  orders(screen: Orders(), label: 'Orders', icon: Icons.assignment),
  profile(screen: Profile(), label: 'Profile', icon: Icons.person);

  final Widget screen;
  final String label;
  final IconData icon;

  const HomeBottomNavigationBarItem({
    required this.screen,
    required this.label,
    required this.icon,
  });
}
