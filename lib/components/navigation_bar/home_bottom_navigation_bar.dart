import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konkanspecials/view/homepage.dart';
import 'package:konkanspecials/view/orders.dart';
import 'package:konkanspecials/view/account.dart';

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
        selectedItemColor: Colors.green,
        unselectedLabelStyle: GoogleFonts.shantellSans(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
        selectedLabelStyle: GoogleFonts.shantellSans(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        unselectedItemColor: Colors.grey,
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
  homePage(label: 'Home', icon: Icons.home),
  orders(label: 'Orders', icon: Icons.assignment),
  profile(label: 'Account', icon: Icons.person);

  final String label;
  final IconData icon;

  const HomeBottomNavigationBarItem({
    required this.label,
    required this.icon,
  });

  Widget get screen {
    switch (this) {
      case HomeBottomNavigationBarItem.homePage:
        return Homepage();
      case HomeBottomNavigationBarItem.orders:
        return Orders();
      case HomeBottomNavigationBarItem.profile:
        return Account();
    }
  }
}
