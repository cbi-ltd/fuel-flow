import 'package:flutter/material.dart';
import 'package:fuel_flow/app/routes/app_routes.dart';
import 'package:fuel_flow/core/theme/app_theme.dart';
import 'package:fuel_flow/widgets/primary_button.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/app-background.jpeg', fit: BoxFit.cover),
          Container(
            color: AppColors.background.withValues(alpha: 0.9),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/fuelflow.jpeg',
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(
                    text: 'Start Shift',
                    icon: Icons.fax_rounded,
                    onPressed: () {
                      context.go(AppRoutes.startShift);
                    },
                    isOutlined: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
