import 'package:flutter/material.dart';
import 'package:fuel_flow/controllers/fuel_purchase_controller.dart';
import 'package:get/get.dart';

class TransferInController extends GetxController {
  final fuelPurchaseController = Get.find<FuelPurchaseController>();
  final RxInt accountNumber = 9012345978.obs;
  final RxString bankName = 'United Bank For Africa'.obs;

  void submit() {
    final data = {
      'amount': fuelPurchaseController.totalAmount.value,
      "account_number": accountNumber,
      "bank_name": bankName,
    };
    debugPrint(data.toString());
  }
}
