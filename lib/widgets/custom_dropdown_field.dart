import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

class CustomDropdownField extends StatefulWidget {
  final List<String> values;
  final String? label;
  final String? value;
  final bool required;
  final ValueChanged<String?>? onChanged;
  final String? Function(String?)? validator;
  final String? hint;

  const CustomDropdownField({
    super.key,
    this.label,
    required this.values,
    required this.value,
    this.required = false,
    this.onChanged,
    this.validator,
    this.hint,
  });

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 2),
        ],

        Focus(
          onFocusChange: (focused) {
            setState(() {
              _isFocused = focused;
            });
          },
          child: DropdownButtonFormField<String>(
            initialValue: widget.value,
            validator: widget.validator,
            onChanged: widget.onChanged,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: _isFocused ? AppColors.primary : AppColors.textSecondary,
            ),
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(hintText: widget.hint),
            items: widget.values.map((value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
        ),
      ],
    );
  }
}
