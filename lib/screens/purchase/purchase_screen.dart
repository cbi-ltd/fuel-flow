import 'package:flutter/material.dart';
import 'package:fuel_flow/app/routes/app_routes.dart';
import 'package:fuel_flow/controllers/purchase_controller.dart';
import 'package:fuel_flow/widgets/primary_button.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';

class PurchaseScreen extends GetView<PurchaseController> {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase'),
        leading: BackButton(
          onPressed: () {
            context.go(AppRoutes.paymentMethod);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select Account Type',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 16),

            Obx(
              () => RadioGroup<AccountType>(
                groupValue: controller.accountType.value,
                onChanged: (AccountType? value) {
                  if (value != null) {
                    controller.setAccountType(value);
                  }
                },
                child: Column(
                  spacing: 16.0,
                  children: [
                    ListTile(
                      leading: Radio<AccountType>(
                        value: AccountType.savings,
                        innerRadius: WidgetStatePropertyAll<double>(6),
                      ),
                      title: const Text('Savings'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: AppColors.border),
                      ),
                    ),

                    ListTile(
                      leading: Radio<AccountType>(
                        value: AccountType.current,
                        innerRadius: WidgetStatePropertyAll<double>(6),
                      ),
                      title: const Text('Current'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: AppColors.border),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            PrimaryButton(
              text: 'Continue',
              icon: Icons.arrow_forward_sharp,
              onPressed: () {
                controller.submit();
                context.go(AppRoutes.insertPin);
              },
            ),
          ],
        ),
      ),
    );
  }
}
