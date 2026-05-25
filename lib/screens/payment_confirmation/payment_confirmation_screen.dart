import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel_flow/app/routes/app_routes.dart';
import 'package:fuel_flow/controllers/payment_confirmation_controller.dart';
import 'package:fuel_flow/core/theme/app_theme.dart';
import 'package:fuel_flow/core/utils/formatters.dart';
import 'package:fuel_flow/widgets/primary_button.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class PaymentConfirmationScreen extends GetView<PaymentConfirmationController> {
  const PaymentConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final status = controller.status.value;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Formatters.formatAmount.format(
                    controller.fuelPurchaseController.totalAmount.value,
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 24),
                Column(children: [_icon(status), _title(status)]),
                const SizedBox(height: 24),
                PrimaryButton(
                  text: 'Close',
                  isOutlined: true,
                  onPressed: () {
                    context.go(AppRoutes.fuelPurchase);
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

Widget _icon(PaymentStatus status) {
  switch (status) {
    case PaymentStatus.success:
      return SvgPicture.asset(
        'assets/icons/success.svg',
        height: 100,
        width: 100,
      );
    case PaymentStatus.failed:
      return SvgPicture.asset(
        'assets/icons/failed.svg',
        height: 100,
        width: 100,
      );
    case PaymentStatus.pending:
      return SvgPicture.asset(
        'assets/icons/pending.svg',
        height: 100,
        width: 100,
      );
  }
}

Widget _title(PaymentStatus status) {
  switch (status) {
    case PaymentStatus.success:
      return const Text(
        "Successful",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      );
    case PaymentStatus.failed:
      return const Text(
        "Ooops! Transaction Failed",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      );
    case PaymentStatus.pending:
      return const Text(
        "Transaction pending...",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      );
  }
}
