import 'package:flutter/material.dart';
import 'package:fuel_flow/controllers/close_shift_controller.dart';
import 'package:fuel_flow/controllers/fuel_purchase_controller.dart';
import 'package:fuel_flow/controllers/insert_card_controller.dart';
import 'package:fuel_flow/controllers/insert_pin_controller.dart';
import 'package:fuel_flow/controllers/payment_method_controller.dart';
import 'package:fuel_flow/controllers/purchase_controller.dart';
import 'package:fuel_flow/controllers/start_shift_controller.dart';
import 'package:fuel_flow/screens/close_shift/close_shift_screen.dart';
import 'package:fuel_flow/screens/fuel_purchase/fuel_purchase_screen.dart';
import 'package:fuel_flow/screens/insert_card/insert_card_screen.dart';
import 'package:fuel_flow/screens/insert_pin/insert_pin_screen.dart';
import 'package:fuel_flow/screens/payment_method/payment_method_screen.dart';
import 'package:fuel_flow/screens/purchase/purchase_screen.dart';
import 'package:fuel_flow/screens/splash/splash_screen.dart';
import 'package:fuel_flow/screens/start_shift/start_shift_screen.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),

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
      path: '/close-shift',
      builder: (BuildContext context, GoRouterState state) {
        Get.lazyPut(() => CloseShiftController());

        return const CloseShiftScreen();
      },
    ),
  ],
);
