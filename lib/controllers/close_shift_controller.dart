import 'package:flutter/cupertino.dart';
import 'package:fuel_flow/core/utils/formatters.dart';
import 'package:get/get.dart';

class CloseShiftController extends GetxController {
  final DateTime localTime = DateTime.now();

  final closingMeterReadingController = TextEditingController();
  final RxDouble totalLitresSold = 0.0.obs;
  final RxString closingMeterReading = ''.obs;
  final RxInt totalRevenue = 0.obs;
  final RxDouble openingMeterReading = 45120.5.obs;

  final litrePriceController = TextEditingController(
    text: Formatters.formatAmount.format(1330),
  );

  @override
  void onInit() {
    super.onInit();
    // Add listener to automatically calculate total litres when closing meter reading is typed
    closingMeterReadingController.addListener(_calculateTotalLitresSold);
    litrePriceController.addListener(_calculateTotalRevenue);
    ever(totalLitresSold, (_) => _calculateTotalRevenue());
  }

  void _calculateTotalLitresSold() {
    final closingMeterText = closingMeterReadingController.text;
    closingMeterReading.value = closingMeterText;
    final openingMeterValue = openingMeterReading.value;

    if (closingMeterText.isEmpty) {
      totalLitresSold.value = 0.0;
      return;
    }

    final closing = double.tryParse(closingMeterText) ?? 0.0;
    final opening = openingMeterValue;

    debugPrint(closing.toString());
    debugPrint(opening.toString());

    if (closing < opening) {
      totalLitresSold.value = 0.0;
    } else {
      totalLitresSold.value = (closing - opening);
    }
  }

  void _calculateTotalRevenue() {
    final totalLitres = totalLitresSold.value;
    final pricePerLitre = Formatters.formatAmount
        .parse(litrePriceController.text)
        .toDouble();

    if ((totalLitres) == 0) {
      totalRevenue.value = 0;
    }

    debugPrint(totalLitres.toString());
    debugPrint(pricePerLitre.toString());

    totalRevenue.value = (totalLitres * pricePerLitre).round();
  }

  void submit() {
    final data = {
      "opening_meter_reading": openingMeterReading.value,
      "closing_meter_reading": closingMeterReadingController.text.trim(),
      "total_revenue": totalRevenue.value,
      "total_litres_sold": totalLitresSold.value,
    };

    debugPrint(data.toString());
  }

  @override
  void dispose() {
    closingMeterReadingController.dispose();
    litrePriceController.dispose();
    super.dispose();
  }
}
