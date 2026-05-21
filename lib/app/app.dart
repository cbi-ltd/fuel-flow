import 'package:flutter/material.dart';
import 'package:fuel_flow/app/routes/app_pages.dart';
import 'package:fuel_flow/core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FuelFlow',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: AppTheme.theme,
    );
  }
}
