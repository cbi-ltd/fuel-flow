import 'package:flutter/material.dart';
import 'package:fuel_flow/app/routes/app_routes.dart';
import 'package:fuel_flow/controllers/transfer_in_controller.dart';
import 'package:fuel_flow/core/theme/app_theme.dart';
import 'package:fuel_flow/core/utils/formatters.dart';
import 'package:fuel_flow/widgets/payment_status_badge.dart';
import 'package:fuel_flow/widgets/primary_button.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class TransferInScreen extends GetView<TransferInController> {
  const TransferInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer-In'),
        leading: BackButton(
          onPressed: () {
            context.go(AppRoutes.paymentMethod);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            spacing: 16.0,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        Text('Total Amount'),
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
                        PaymentStatusBadge(status: PaymentStatus.pending),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.cardBorder,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 8.0,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.account_balance_sharp,
                            color: AppColors.surface,
                          ),
                        ),
                      ),
                      Obx(
                        () => Flexible(
                          child: Text(
                            controller.bankName.value,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.cardBorder,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 4.0,
                    children: [
                      Text(
                        'VIRTUAL ACCOUNT NUMBER',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Obx(
                        () => Text(
                          controller.accountNumber.toString(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.failed,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primary, width: 0.4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    spacing: 4.0,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.lock_clock,
                        size: 24,
                        color: AppColors.textFailed,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Transaction Expiry Notice',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: AppColors.textFailed,
                              ),
                            ),
                            Text(
                              'This account is valid for 10 minutes. Please complete the transfer before the time runs out to avoid cancellation.',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.textFailed,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PrimaryButton(
                text: 'I Have Paid',
                onPressed: () {
                  context.go(AppRoutes.paymentConfirmation);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
