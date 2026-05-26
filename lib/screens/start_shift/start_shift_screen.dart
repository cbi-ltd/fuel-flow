import 'package:flutter/material.dart';
import 'package:fuel_flow/app/routes/app_routes.dart';
import 'package:fuel_flow/controllers/start_shift_controller.dart';
import 'package:fuel_flow/widgets/custom_dropdown_field.dart';
import 'package:fuel_flow/widgets/custom_text_field.dart';
import 'package:fuel_flow/widgets/primary_button.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class StartShiftScreen extends GetView<StartShiftController> {
  const StartShiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>
          Scaffold(
            appBar: AppBar(title: const Text("Start Shift")),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomDropdownField(
                    label: 'Select Pump',
                    hint: 'Choose a pump...',
                    values: controller.pumps,
                    value: controller.selectedPump.value,
                    onChanged: (val) {
                      controller.selectedPump.value = val;
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Please select a pump";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 8),

                  CustomDropdownField(
                    label: 'Assigned Attendant',
                    hint: 'Select attendant...',
                    values: controller.attendants,
                    value: controller.selectedAttendant.value,
                    onChanged: (val) {
                      controller.selectedAttendant.value = val;
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Please select your name";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 8),

                  CustomDropdownField(
                    label: 'Product Type',
                    hint: 'Select product...',
                    values: controller.products,
                    value: controller.selectedProduct.value,
                    onChanged: (val) {
                      controller.selectProduct(val);
                    },
                  ),

                  const SizedBox(height: 8),

                  if (controller.selectedProduct.value == 'Oil')
                    CustomDropdownField(
                      label: "Litres",
                      hint: 'Select litre',
                      values: controller.availableLitres,
                      value: controller.selectedLitre.value,
                      onChanged: (val) => controller.selectedLitre.value = val,
                      validator: (value) {
                        if (controller.selectedProduct.value == 'Oil' &&
                            value == null) {
                          return "Please select a litre";
                        }
                        return null;
                      },
                    ),

                  const SizedBox(height: 8),

                  CustomTextField(
                    label: 'Opening Meter Reading',
                    hint: '000000.00',
                    prefixIcon: Icons.gas_meter,
                    controller: controller.meterReadingController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null) {
                        return 'Please fill opening meter reading';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  PrimaryButton(
                    text: 'Save and Continue',
                    icon: Icons.arrow_forward_sharp,
                    onPressed: () {
                      controller.submit();
                      context.go(AppRoutes.insertPin);
                    },
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
