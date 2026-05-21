import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class InsertPinController extends GetxController {
  final pinController = PinInputController();

  void onPinChanged(String value) {
    // Handle PIN change if needed
  }

  void onPinCompleted(String value) {
    if (kDebugMode) {
      debugPrint(pinController.text);
    }
  }

  @override
  void onClose() {
    pinController.dispose();
    super.onClose();
  }
}
