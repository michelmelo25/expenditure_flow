import 'package:expenseflow/core/config/consts/app_colors.dart';
import 'package:expenseflow/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final HomeController controller;
  const BottomNavigationBarWidget(this.controller, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
          Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5)),
              child: IconButton(
                onPressed: () {
                  Modular.to.pushNamed("/add", arguments: controller);
                },
                icon: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.stroke,
                ),
              )),
          IconButton(onPressed: () {}, icon: Icon(Icons.description_outlined)),
        ],
      ),
    );
  }
}
