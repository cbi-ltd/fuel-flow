import 'package:intl/intl.dart';

class Formatters {
  static final formatAmount = NumberFormat.currency(
    locale: "en_US",
    name: "NGN",
    symbol: "₦",
    decimalDigits: 2,
    // customPattern: "###.0#"
    // customPattern: "###.##"
  );

  static dynamic formatKoboAmount(double amount) =>
      formatAmount.format(amount / 100);
}
