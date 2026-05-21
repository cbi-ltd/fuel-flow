import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

enum AccountType { savings, current }

class PurchaseController extends GetxController {
  final accountType = AccountType.savings.obs;

  void setAccountType(AccountType type) {
    accountType.value = type;
  }

  void submit() {
    final data = {'type': accountType.value.name};

    if (kDebugMode) {
      debugPrint(data.toString());
    }
  }
}
