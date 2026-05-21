import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StartShiftController extends GetxController {
  // final formKey = GlobalKey<FormState>();

  // controllers
  final Rxn<String> selectedPump = Rxn<String>();
  final Rxn<String> selectedAttendant = Rxn<String>();
  final Rxn<String> selectedProduct = Rxn<String>();
  final Rxn<String> selectedLitre = Rxn<String>();
  final meterReadingController = TextEditingController();

  // Data
  final pumps = <String>['Pump 1', 'Pump 2', 'Pump 3'];

  final attendants = <String>['John', 'Mary', 'Alex'];

  final products = <String>['Oil', 'Fuel', 'Gas', 'Diesel', 'Kerosene'];

  final Map<String, List<String>> litreMap = {
    'Oil': ['1L', '5L', '25L'],
  };

  List<String> get availableLitres {
    final product = selectedProduct.value;
    return litreMap[product] ?? [];
  }

  void selectProduct(String? value) {
    selectedProduct.value = value;
    selectedLitre.value = null; // reset dependent field
  }

  // bool get isValid =>
  //     selectedPump.value != null &&
  //     selectedAttendant.value != null &&
  //     selectedProduct.value != null &&
  //     (selectedProduct.value != 'Oil' || selectedLitre.value != null) &&
  //     meterReadingController.text.trim().isNotEmpty;

  void submit() {
    // if (!isValid) {
    //   Get.snackbar('Missing fields', 'Please complete all required fields');
    //   return;
    // }

    final data = {
      'pump': selectedPump.value,
      'attendant': selectedAttendant.value,
      'product': selectedProduct.value,
      if (selectedProduct.value == 'Oil' && selectedLitre.value != null)
        'litre': selectedLitre.value,
      'meter': meterReadingController.text.trim(),
    };

    debugPrint(data.toString());

    Get.snackbar('Success', 'Shift started successfully');
  }

  @override
  void onClose() {
    meterReadingController.dispose();
    super.onClose();
  }
}
