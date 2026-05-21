import 'package:flutter/material.dart';
import 'package:fuel_flow/app/routes/app_routes.dart';
import 'package:fuel_flow/controllers/insert_pin_controller.dart';
import 'package:fuel_flow/core/theme/app_theme.dart';
import 'package:fuel_flow/widgets/primary_button.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class InsertPinScreen extends GetView<InsertPinController> {
  const InsertPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lightPinTheme = MaterialPinTheme(
      shape: MaterialPinShape.outlined,
      cellSize: const Size(56, 64),
      spacing: 12,
      borderRadius: BorderRadius.circular(12),
      borderWidth: 1.5,
      focusedBorderWidth: 2.5,
      borderColor: AppColors.border,
      focusedBorderColor: AppColors.primary,
      fillColor: Colors.transparent,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Insert Pin')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialPinField(
              length: 4,
              pinController: controller.pinController,
              theme: lightPinTheme,
              keyboardType: TextInputType.number,
              obscureText: true,
              onChanged: controller.onPinChanged,
              onCompleted: controller.onPinCompleted,
            ),

            const SizedBox(height: 24),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4.0, // horizontal gap between chips
              children: [
                Text(
                  'Hi Clement,',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                ),
                Text(
                  'Please Enter Your PIN',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 24),

            PrimaryButton(
              text: 'Proceed',
              icon: Icons.arrow_forward,
              onPressed: () {
                controller.onPinCompleted;
                context.go(AppRoutes.fuelPurchase);
                controller.pinController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
