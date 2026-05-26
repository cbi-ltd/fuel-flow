import 'package:flutter/material.dart';
import 'package:fuel_flow/app/routes/app_routes.dart';
import 'package:fuel_flow/controllers/pay_with_cash_controller.dart';
import 'package:fuel_flow/core/utils/formatters.dart';
import 'package:fuel_flow/widgets/custom_text_field.dart';
import 'package:fuel_flow/widgets/primary_button.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';

class PayWithCashScreen extends GetView<PayWithCashController> {
  const PayWithCashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cash Payment'),
        leading: BackButton(
          onPressed: () {
            context.go(AppRoutes.paymentMethod);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16.0,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primary, width: 0.4),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      spacing: 4.0,
                      children: [
                        Text('Total Amount Due'),
                        Obx(
                          () => Text(
                            Formatters.formatAmount.format(
                              controller
                                  .fuelPurchaseController
                                  .totalAmount
                                  .value,
                            ),
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomTextField(
                label: 'Amount Received',
                hint: 'Enter amount',
                keyboardType: TextInputType.number,
                controller: controller.amountReceivedController,
              ),
              Obx(() {
                final _ = controller.totalChangeAmount.value;
                final amountReceived =
                    int.tryParse(controller.amountReceivedController.text) ?? 0;
                final totalAmountDue =
                    controller.fuelPurchaseController.totalAmount.value;
                if (amountReceived > totalAmountDue) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.cardBorder,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Change Due'),
                          Flexible(
                            child: Text(
                              Formatters.formatAmount.format(
                                controller.totalChangeAmount.value,
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
              Obx(
                () => PrimaryButton(
                  text: 'Confirm Cash Received',
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          controller.submit();
                        },
                  isLoading: controller.isLoading.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
