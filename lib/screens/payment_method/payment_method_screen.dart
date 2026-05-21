import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel_flow/app/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Method'),
        leading: BackButton(
          onPressed: () {
            context.go(AppRoutes.fuelPurchase);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select Payment Method',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            _buildNavigationCard(
              context,
              title: 'Purchase',
              iconPath: 'assets/icons/purchase.svg',
              route: AppRoutes.purchase,
            ),

            _buildNavigationCard(
              context,
              title: 'Transfer In',
              iconPath: 'assets/icons/transfer-in.svg',
              route: AppRoutes.insertCard,
            ),

            _buildNavigationCard(
              context,
              title: 'Cash',
              iconPath: 'assets/icons/cash.svg',
              route: AppRoutes.insertCard,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildNavigationCard(
  BuildContext context, {
  required String title,
  required String iconPath,
  required String route,
}) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(color: AppColors.border),
    ),
    color: AppColors.surface,
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: SvgPicture.asset(iconPath, width: 32, height: 32),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: AppColors.textSecondary,
        ),
      ),

      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: AppColors.primary,
      ),
      onTap: () => context.go(route),
    ),
  );
}
