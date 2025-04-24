import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konkanspecials/model/location_model/location_service.dart';
import 'package:konkanspecials/view/landing_screen.dart';
import 'package:konkanspecials/viewmodel/account_view_model.dart';
import 'package:konkanspecials/viewmodel/home_bottom_navigation_bar_view_model.dart';
import 'package:konkanspecials/viewmodel/item_adding_view_model.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LocationService.instance,
        ),
        ChangeNotifierProvider(
          create: (_) => HomeBottomNavigationBarViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ItemAddingViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => AccountViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    LocationService.instance.getLocation();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            home: LandingScreen(),
          );
        });
  }
}
