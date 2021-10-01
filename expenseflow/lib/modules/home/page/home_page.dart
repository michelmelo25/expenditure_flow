import 'package:expenseflow/core/config/consts/app_colors.dart';
import 'package:expenseflow/core/config/consts/app_styles.dart';
import 'package:expenseflow/modules/home/controller/home_controller.dart';
import 'package:expenseflow/modules/home/widgets/home_body_widget.dart';
import 'package:expenseflow/shared/Models/user_model.dart';
import 'package:expenseflow/shared/Widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  final UserModel? user;
  const HomePage(this.controller, {this.user, Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.controller.initApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: HomeBodyWidget(widget.controller),
      bottomNavigationBar: BottomNavigationBarWidget(widget.controller),
    );
  }
}

PreferredSize buildAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(125),
    child: Container(
      height: 152,
      color: AppColors.primary,
      child: Center(
        child: ListTile(
          title: Text.rich(
            TextSpan(text: "Olá, ", style: AppStyles.titleRegular, children: [
              TextSpan(text: "Michel", style: AppStyles.titleBoldBackground)
            ]),
          ),
          subtitle: Text(
            "Mantenha suas contas em dia",
            style: AppStyles.captionShape,
          ),
        ),
      ),
    ),
  );
}
