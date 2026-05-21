import 'package:flutter/material.dart';
import 'package:fuel_flow/app/routes/app_routes.dart';
import 'package:fuel_flow/controllers/fuel_purchase_controller.dart';
import 'package:fuel_flow/core/theme/app_theme.dart';
import 'package:fuel_flow/core/utils/formatters.dart';
import 'package:fuel_flow/widgets/custom_text_field.dart';
import 'package:fuel_flow/widgets/primary_button.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class FuelPurchaseScreen extends GetView<FuelPurchaseController> {
  // final DateTime localTime = DateTime.now();

  const FuelPurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Fuel Purchase'),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app, color: AppColors.primary),
              tooltip: 'Close Shift',
              onPressed: () {
                context.go(AppRoutes.closeShift);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16.0,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.cardBorder),
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ), // Optional: rounded corners
                  ),
                  color: AppColors.card,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date & Time",
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 2),

                                Text(
                                  DateFormat(
                                    'dd/MM/yyyy, HH:mm',
                                  ).format(controller.localTime),
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Text(
                                  "Attendant",
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "J. Miller",
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Divider(
                          color: AppColors.border,
                          thickness: 1,
                          height: 20,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Selected Pump"),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 4,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.primaryLight,
                              ),
                              child: Row(
                                spacing: 2,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.heat_pump,
                                    color: AppColors.primary,
                                  ),
                                  Text(
                                    'Pump 2',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    height: 40,
                    // margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: AppColors.border,
                    ),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        color: AppColors.textSecondary,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelColor: AppColors.textWhite,
                      tabs: [
                        Tab(text: 'By Litres'),
                        Tab(text: 'By Amount'),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 100,
                  child: TabBarView(
                    children: [
                      CustomTextField(
                        label: 'Litres to Dispense',
                        hint: 'Enter litre',
                        keyboardType: TextInputType.number,
                        controller: controller.litreToDispenseController,
                      ),
                      CustomTextField(
                        label: 'Amount',
                        hint: 'Enter amount',
                        keyboardType: TextInputType.number,
                        controller: controller.amountController,
                      ),
                    ],
                  ),
                ),

                CustomTextField(
                  label: 'Current Price Per Litre',
                  controller: controller.litrePriceController,
                  readOnly: true,
                ),

                // SizedBox(height: 4),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.cardBorder),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: AppColors.card,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('TOTAL AMOUNT'),
                          SizedBox(height: 4),
                          Obx(
                            () => Text(
                              Formatters.formatAmount.format(
                                controller.totalAmount.value,
                              ),
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 32,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // SizedBox(height: 4),
                PrimaryButton(
                  text: 'Authorize Pump',
                  icon: Icons.local_gas_station,
                  onPressed: () {
                    controller.submit();
                    context.go(AppRoutes.paymentMethod);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
