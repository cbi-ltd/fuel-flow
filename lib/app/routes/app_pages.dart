import 'package:flutter/material.dart';
import 'package:fuel_flow/app/routes/app_routes.dart';
import 'package:fuel_flow/controllers/close_shift_controller.dart';
import 'package:fuel_flow/controllers/fuel_purchase_controller.dart';
import 'package:fuel_flow/controllers/insert_card_controller.dart';
import 'package:fuel_flow/controllers/insert_pin_controller.dart';
import 'package:fuel_flow/controllers/pay_with_cash_controller.dart';
import 'package:fuel_flow/controllers/payment_confirmation_controller.dart';
import 'package:fuel_flow/controllers/payment_method_controller.dart';
import 'package:fuel_flow/controllers/purchase_controller.dart';
import 'package:fuel_flow/controllers/start_shift_controller.dart';
import 'package:fuel_flow/controllers/transfer_in_controller.dart';
import 'package:fuel_flow/screens/close_shift/close_shift_screen.dart';
import 'package:fuel_flow/screens/fuel_purchase/fuel_purchase_screen.dart';
import 'package:fuel_flow/screens/insert_card/insert_card_screen.dart';
import 'package:fuel_flow/screens/insert_pin/insert_pin_screen.dart';
import 'package:fuel_flow/screens/pay_with_cash/pay_with_cash_screen.dart';
import 'package:fuel_flow/screens/payment_confirmation/payment_confirmation_screen.dart';
import 'package:fuel_flow/screens/payment_method/payment_method_screen.dart';
import 'package:fuel_flow/screens/purchase/purchase_screen.dart';
import 'package:fuel_flow/screens/start_shift/start_shift_screen.dart';
import 'package:fuel_flow/screens/transfer_in/transfer_in_screen.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.startShift,
  routes: <RouteBase>[
    GoRoute(
      path: '/start-shift',
      builder: (BuildContext context, GoRouterState state) {
        Get.lazyPut(() => StartShiftController());

        return const StartShiftScreen();
      },
    ),

    GoRoute(
      path: '/insert-pin',
      builder: (BuildContext context, GoRouterState state) {
        Get.lazyPut(() => InsertPinController());

        return const InsertPinScreen();
      },
    ),

    GoRoute(
      path: '/fuel-purchase',
      builder: (BuildContext context, GoRouterState state) {
        Get.put(FuelPurchaseController());

        return const FuelPurchaseScreen();
      },
    ),

    GoRoute(
      path: '/payment-method',
      builder: (BuildContext context, GoRouterState state) {
        Get.lazyPut(() => PaymentMethodController());

        return const PaymentMethodScreen();
      },
    ),

    GoRoute(
      path: '/purchase',
      builder: (BuildContext context, GoRouterState state) {
        Get.lazyPut(() => PurchaseController());

        return const PurchaseScreen();
      },
    ),

    GoRoute(
      path: '/insert-card',
      builder: (BuildContext context, GoRouterState state) {
        Get.lazyPut(() => InsertCardController());

        return const InsertCardScreen();
      },
    ),

    GoRoute(
      path: '/transfer-in',
      builder: (BuildContext context, GoRouterState state) {
        Get.lazyPut(() => TransferInController());

        return const TransferInScreen();
      },
    ),

    GoRoute(
      path: '/pay-with-cash',
      builder: (BuildContext context, GoRouterState state) {
        Get.lazyPut(() => PayWithCashController());

        return const PayWithCashScreen();
      },
    ),

    GoRoute(
      path: '/payment-confirmation',
      builder: (BuildContext context, GoRouterState state) {
        Get.lazyPut(() => PaymentConfirmationController());

        return const PaymentConfirmationScreen();
      },
    ),

    GoRoute(
      path: '/close-shift',
      builder: (BuildContext context, GoRouterState state) {
        Get.lazyPut(() => CloseShiftController());

        return const CloseShiftScreen();
      },
    ),
  ],
);
