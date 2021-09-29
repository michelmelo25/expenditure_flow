import 'package:expenseflow/core/config/consts/app_styles.dart';
import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  final String title;
  const NotFoundWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          title,
          style: AppStyles.titleBoldBackground,
          softWrap: true,
        ),
      ),
    );
  }
}
