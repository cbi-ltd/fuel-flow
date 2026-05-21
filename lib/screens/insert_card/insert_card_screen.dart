import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel_flow/app/routes/app_routes.dart';
import 'package:fuel_flow/controllers/fuel_purchase_controller.dart';
import 'package:fuel_flow/core/theme/app_theme.dart';
import 'package:fuel_flow/core/utils/formatters.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class InsertCardScreen extends StatelessWidget {
  const InsertCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fuelPurchaseController = Get.find<FuelPurchaseController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase'),
        leading: BackButton(
          onPressed: () {
            context.go(AppRoutes.purchase);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.primary, width: 0.4),
              ),

              clipBehavior: Clip.hardEdge,

              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: SvgPicture.asset(
                      'assets/icons/left-pattern.svg',
                      width: 120,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    right: 0,
                    top: 0,
                    child: SvgPicture.asset(
                      'assets/icons/right-pattern.svg',
                      width: 100,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 28),

                          SvgPicture.asset('assets/icons/card.svg', width: 90),

                          const SizedBox(height: 28),

                          Obx(
                            () => Text(
                              Formatters.formatAmount.format(
                                fuelPurchaseController.totalAmount.value,
                              ),
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            "Please Insert Your Card Into The POS",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.textSecondary),
                          ),

                          const SizedBox(height: 20),

                          const Icon(
                            Icons.keyboard_double_arrow_down,
                            color: AppColors.primary,
                            size: 42,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
