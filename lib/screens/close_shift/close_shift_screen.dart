import 'package:flutter/material.dart';
import 'package:fuel_flow/app/routes/app_routes.dart';
import 'package:fuel_flow/controllers/close_shift_controller.dart';
import 'package:fuel_flow/core/theme/app_theme.dart';
import 'package:fuel_flow/core/utils/formatters.dart';
import 'package:fuel_flow/widgets/custom_text_field.dart';
import 'package:fuel_flow/widgets/dashed_line_painter.dart';
import 'package:fuel_flow/widgets/primary_button.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class CloseShiftScreen extends GetView<CloseShiftController> {
  const CloseShiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Close Shift'),
        leading: BackButton(
          onPressed: () {
            context.go(AppRoutes.fuelPurchase);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            spacing: 12.0,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('CURRENT TIME'),
                    Text(
                      DateFormat(
                        'dd/MM/yyyy, HH:mm',
                      ).format(controller.localTime),
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),

              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.cardBorder),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: AppColors.surface,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.border,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.person,
                              color: AppColors.primary,
                            ),
                          ),

                          const SizedBox(width: 8),

                          Column(
                            spacing: 2.0,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Attendant'),
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
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
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.border,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.local_gas_station,
                              color: AppColors.primary,
                            ),
                          ),

                          const SizedBox(width: 8),

                          Column(
                            spacing: 2.0,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Active Pump'),
                              Text(
                                'Pump 2 - Petrol',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              CustomTextField(
                label: 'Closing Meter Reading',
                controller: controller.closingMeterReadingController,
                hint: '000000.00',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null) {
                    return 'Please fill closing meter reading';
                  }
                  return null;
                },
                prefixIcon: Icons.gas_meter,
              ),

              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.cardBorder),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: AppColors.surface,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.cardBorder,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.cardBorder, // Choose your color
                            width: 1.0, // Choose your thickness
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 4.0,
                        children: [
                          Icon(Icons.receipt_long),
                          Text(
                            'Shift Summary',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        spacing: 12.0,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Opening Reading'),

                              Text(
                                controller.openingMeterReading.toString(),
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),

                          SizedBox(
                            width: double.infinity,
                            child: CustomPaint(painter: DashedLinePainter()),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Closing Reading'),

                              Obx(() {
                                return Text(
                                  controller.closingMeterReading.value,
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                );
                              }),
                            ],
                          ),

                          SizedBox(
                            width: double.infinity,
                            child: CustomPaint(painter: DashedLinePainter()),
                          ),

                          Container(),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.cardBorder,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: AppColors.border),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          spacing: 4,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'TOTAL LITRES SOLD',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),

                                Obx(() {
                                  return Text(
                                    controller.totalLitresSold.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primary,
                                    ),
                                  );
                                }),
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
                                Text(
                                  'TOTAL REVENUE',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),

                                Obx(() {
                                  return Text(
                                    Formatters.formatAmount.format(
                                      controller.totalRevenue.value,
                                    ),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              PrimaryButton(
                text: 'Save and Close Shift',
                icon: Icons.lock,
                onPressed: () {
                  controller.submit();
                  context.go(AppRoutes.startShift);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
