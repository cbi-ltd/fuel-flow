import 'package:flutter/material.dart';
import 'package:fuel_flow/core/utils/formatters.dart';
import 'package:get/get.dart';

class FuelPurchaseController extends GetxController {
  final litrePriceController = TextEditingController(
    text: Formatters.formatAmount.format(1330),
  );
  final litreToDispenseController = TextEditingController();
  final amountController = TextEditingController();
  final RxInt totalAmount = 0.obs;

  final DateTime localTime = DateTime.now();

  @override
  void onInit() {
    super.onInit();
    // Add listener to automatically calculate total amount when litres are typed
    litreToDispenseController.addListener(_calculateTotal);
    amountController.addListener(_syncAmountToTotal);
  }

  void _syncAmountToTotal() {
    final amountText = amountController.text;

    if (amountText.isEmpty) {
      if (litreToDispenseController.text.isEmpty) {
        totalAmount.value = 0;
      }
      return;
    }

    final amount = int.tryParse(amountText) ?? 0;
    totalAmount.value = amount;
  }

  void _calculateTotal() {
    final litresText = litreToDispenseController.text;

    if (litresText.isEmpty || litrePriceController.text.isEmpty) {
      totalAmount.value = 0;
      return;
    }

    final litres = double.tryParse(litresText) ?? 0;

    final price = Formatters.formatAmount
        .parse(litrePriceController.text)
        .toDouble();

    debugPrint(litres.toString());
    debugPrint(price.toString());

    totalAmount.value = (litres * price).round();
  }

  void submit() {
    // if (!isValid) {
    //   Get.snackbar('Missing fields', 'Please complete all required fields');
    //   return;
    // }

    final price = Formatters.formatAmount
        .parse(litrePriceController.text)
        .toDouble();

    final data = {
      if (litreToDispenseController.text.trim().isNotEmpty)
        'litres': litreToDispenseController.text.trim(),
      'price_per_litre': price,
      if (amountController.text.trim().isNotEmpty)
        'amount': amountController.text.trim(),
      'total_amount': totalAmount.value,
    };

    debugPrint(data.toString());

    Get.snackbar('Success', 'Shift started successfully');
  }

  @override
  void dispose() {
    litrePriceController.dispose();
    litreToDispenseController.dispose();
    amountController.dispose();
    super.dispose();
  }
}
