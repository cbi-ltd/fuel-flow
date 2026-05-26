import 'package:flutter_test/flutter_test.dart';
import 'package:fuel_flow/controllers/close_shift_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CloseShiftController Tests', () {
    late CloseShiftController controller;

    setUp(() {
      controller = CloseShiftController();
      controller.onInit();
    });

    test('Calculation of total litres sold', () {
      controller.closingMeterReadingController.text = '45130.5';
      // The listener should be triggered
      expect(controller.totalLitresSold.value, 10.0);
      expect(controller.closingMeterReading, '45130.5');
    });

    test('Calculation of total revenue', () {
      controller.closingMeterReadingController.text = '45130.5';
      // totalLitresSold should be 10.0
      // litrePriceController default is 1330 formatted
      // totalRevenue should be 10.0 * 1330 = 13300
      expect(controller.totalRevenue.value, 13300);
    });

    test('Empty closing meter reading', () {
      controller.closingMeterReadingController.text = '';
      expect(controller.totalLitresSold.value, 0.0);
      expect(controller.totalRevenue.value, 0);
    });

    test('Closing meter less than opening', () {
      controller.closingMeterReadingController.text = '45110.5';
      expect(controller.totalLitresSold.value, 0.0);
      expect(controller.totalRevenue.value, 0);
    });
  });
}
