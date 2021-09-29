import 'package:expenseflow/core/config/consts/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
          GestureDetector(
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5)),
              child: Icon(
                Icons.add_box_outlined,
                color: AppColors.stroke,
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.description_outlined)),
        ],
      ),
    );
  }
}
