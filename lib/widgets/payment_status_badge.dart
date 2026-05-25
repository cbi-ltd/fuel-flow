import 'package:flutter/material.dart';
import 'package:fuel_flow/core/theme/app_theme.dart';

enum PaymentStatus { paid, pending, failed, refunded }

class PaymentStatusBadge extends StatelessWidget {
  final PaymentStatus status;

  const PaymentStatusBadge({super.key, required this.status});

  Color get backgroundColor {
    switch (status) {
      case PaymentStatus.paid:
        return AppColors.success;
      case PaymentStatus.pending:
        return AppColors.pending;
      case PaymentStatus.failed:
        return AppColors.failed;
      case PaymentStatus.refunded:
        return Colors.blue.shade100;
    }
  }

  Color get textColor {
    switch (status) {
      case PaymentStatus.paid:
        return AppColors.textSuccess;
      case PaymentStatus.pending:
        return AppColors.textPending;
      case PaymentStatus.failed:
        return AppColors.textFailed;
      case PaymentStatus.refunded:
        return Colors.blue.shade800;
    }
  }

  IconData get icon {
    switch (status) {
      case PaymentStatus.paid:
        return Icons.check_circle;
      case PaymentStatus.pending:
        return Icons.access_time;
      case PaymentStatus.failed:
        return Icons.cancel;
      case PaymentStatus.refunded:
        return Icons.reply;
    }
  }

  String get label {
    switch (status) {
      case PaymentStatus.paid:
        return 'Paid';
      case PaymentStatus.pending:
        return 'Pending';
      case PaymentStatus.failed:
        return 'Failed';
      case PaymentStatus.refunded:
        return 'Refunded';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
