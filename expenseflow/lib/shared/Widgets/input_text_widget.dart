import 'package:expenseflow/core/config/consts/app_colors.dart';
import 'package:expenseflow/core/config/consts/app_styles.dart';
import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String value) onChanged;
  final Function()? onTap;
  final bool? enable;
  final bool readOnly;
  final Widget? suffixIcon;
  const InputTextWidget(
      {Key? key,
      required this.label,
      required this.icon,
      this.initialValue,
      this.validator,
      this.controller,
      required this.onChanged,
      this.onTap,
      this.keyboardType,
      this.enable,
      this.suffixIcon,
      this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            onChanged: onChanged,
            initialValue: initialValue,
            validator: validator,
            keyboardType: keyboardType,
            style: AppStyles.input,
            onTap: onTap,
            enabled: enable,
            readOnly: readOnly,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: label,
                labelStyle: AppStyles.input,
                suffixIcon: suffixIcon,
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Icon(
                        icon,
                        color: AppColors.primary,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 48,
                      color: AppColors.stroke,
                    )
                  ],
                ),
                border: InputBorder.none),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          )
        ],
      ),
    );
  }
}
