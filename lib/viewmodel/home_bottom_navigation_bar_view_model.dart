import 'package:flutter/material.dart';
import 'package:konkanspecials/components/navigation_bar/home_bottom_navigation_bar.dart';

class HomeBottomNavigationBarViewModel extends ChangeNotifier {
  HomeBottomNavigationBarItem selectedItem =
      HomeBottomNavigationBarItem.homePage;

  void setSelectedItem(HomeBottomNavigationBarItem item) {
    selectedItem = item;
    notifyListeners();
  }
}
