import 'package:expenseflow/core/config/consts/app_strings.dart';
import 'package:expenseflow/modules/home/controller/home_controller.dart';
import 'package:expenseflow/shared/Widgets/not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeBodyWidget extends StatefulWidget {
  final HomeController controller;
  const HomeBodyWidget(this.controller, {Key? key}) : super(key: key);

  @override
  _HomeBodyWidgetState createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return widget.controller.expenses.fold(
          (l) => NotFoundWidget(title: AppStrings.expenseNotRegister),
          (r) => Container());
    });
  }
}
