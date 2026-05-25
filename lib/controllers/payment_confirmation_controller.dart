import 'package:fuel_flow/controllers/fuel_purchase_controller.dart';
import 'package:get/get.dart';

enum PaymentStatus { success, failed, pending }

class PaymentConfirmationController extends GetxController {
  final Rx<PaymentStatus> status = PaymentStatus.pending.obs;
  final RxBool isLoading = false.obs;
  final RxString transactionId = ''.obs;
  final fuelPurchaseController = Get.find<FuelPurchaseController>();

  @override
  void onInit() {
    super.onInit();
    verifyPayment();
  }

  Future<void> verifyPayment() async {
    try {
      isLoading.value = true;
      // simulate API call
      await Future.delayed(const Duration(seconds: 2));
      // TODO: replace with real API response
      final responseStatus = "success"; // success | failed | pending
      status.value = _mapStatus(responseStatus);
      // optional: auto retry if pending
      if (status.value == PaymentStatus.pending) {
        _startPolling();
      }
    } catch (e) {
      status.value = PaymentStatus.failed;
    } finally {
      isLoading.value = false;
    }
  }

  PaymentStatus _mapStatus(String status) {
    switch (status.toLowerCase()) {
      case "success":
        return PaymentStatus.success;
      case "failed":
        return PaymentStatus.failed;
      default:
        return PaymentStatus.pending;
    }
  }

  void _startPolling() {
    Future.delayed(const Duration(seconds: 5), () async {
      if (status.value == PaymentStatus.pending) {
        await verifyPayment();
      }
    });
  }

  @override
  void dispose() {
    fuelPurchaseController.dispose();
    super.dispose();
  }
}
