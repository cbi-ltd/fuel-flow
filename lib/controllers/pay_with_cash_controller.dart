import 'package:flutter/material.dart';
import 'package:fuel_flow/controllers/fuel_purchase_controller.dart';
import 'package:get/get.dart';

class PayWithCashController extends GetxController {
  final fuelPurchaseController = Get.find<FuelPurchaseController>();
  final amountReceivedController = TextEditingController();
  final RxInt totalChangeAmount = 0.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    amountReceivedController.addListener(_calculateChange);
  }

  void _calculateChange() {
    final amountReceivedControllerText = amountReceivedController.text;
    final fuelPurchaseControllerAmount =
        fuelPurchaseController.totalAmount.value;
    if (amountReceivedControllerText.isEmpty) {
      totalChangeAmount.value = 0;
      return;
    }
    final amountReceived = int.tryParse(amountReceivedControllerText) ?? 0;
    if (amountReceived <= fuelPurchaseControllerAmount) {
      totalChangeAmount.value = 0;
    } else {
      totalChangeAmount.value = amountReceived - fuelPurchaseControllerAmount;
    }
  }

  Future<void> submit() async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 5));
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
    final data = {'amount': fuelPurchaseController.totalAmount.value};
    debugPrint(data.toString());
  }

  @override
  void onClose() {
    amountReceivedController.dispose();
    super.onClose();
  }
}
