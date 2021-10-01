import 'package:expenseflow/core/config/consts/app_colors.dart';
import 'package:expenseflow/core/config/consts/app_styles.dart';
import 'package:expenseflow/shared/Widgets/button_widget.dart';
import 'package:flutter/material.dart';

class ButtonNavigationWidget extends StatefulWidget {
  final VoidCallback onPressedPrimary;
  final VoidCallback onPressedSecond;
  const ButtonNavigationWidget({
    Key? key,
    required this.onPressedPrimary,
    required this.onPressedSecond,
  }) : super(key: key);

  @override
  _ButtonNavigationWidgetState createState() => _ButtonNavigationWidgetState();
}

class _ButtonNavigationWidgetState extends State<ButtonNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 57,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 1,
            height: 1,
            color: AppColors.stroke,
          ),
          Container(
            height: 56,
            child: Row(
              children: [
                Expanded(
                    child: ButtonWodget(
                  label: "Cancelar",
                  onPressed: widget.onPressedSecond,
                )),
                Container(
                  width: 1,
                  height: double.maxFinite,
                  color: AppColors.stroke,
                ),
                Expanded(
                    child: ButtonWodget(
                  label: "Salvar",
                  style: AppStyles.buttonPrimary,
                  onPressed: widget.onPressedPrimary,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
