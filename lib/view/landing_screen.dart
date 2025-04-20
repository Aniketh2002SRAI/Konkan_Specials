import 'package:flutter/material.dart';
import 'package:konkanspecials/components/navigation_bar/home_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:konkanspecials/viewmodel/home_bottom_navigation_bar_view_model.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeBottomNavigationBarViewModel>(
        builder: (context, homeBottomNavigationBarViewModel, child) {
      return Scaffold(
        bottomNavigationBar: HomeBottomNavigationBar(),
        body: homeBottomNavigationBarViewModel.selectedItem.screen,
      );
    });
  }
}
