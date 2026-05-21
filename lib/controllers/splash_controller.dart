// import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '/app/routes/app_routes.dart';

class SplashController extends GetxController {
  final terminalSerial = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    await _getTerminalSerial();
    await Future.delayed(const Duration(seconds: 3));
    GoRoute(path: AppRoutes.startShift);
  }

  Future<void> _getTerminalSerial() async {
    try {
      // final deviceInfo = DeviceInfoPlugin();
      // final androidInfo = await deviceInfo.androidInfo;
      // final serial = androidInfo.serialNumber.isNotEmpty
      //     ? androidInfo.serialNumber
      //     : androidInfo.id;

      final serial = '';

      terminalSerial.value = serial;

      // store globally so other controllers can access it
      Get.put<String>(serial, tag: 'terminalSerial', permanent: true);
    } catch (e) {
      final fallback = 'SIM-${DateTime.now().millisecondsSinceEpoch}';
      terminalSerial.value = fallback;
      Get.put<String>(fallback, tag: 'terminalSerial', permanent: true);
    }
  }
}
