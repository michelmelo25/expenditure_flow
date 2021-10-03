import 'package:expenseflow/core/config/consts/app_colors.dart';
import 'package:expenseflow/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

class ApplyFilterWidget extends StatefulWidget {
  final HomeController controller;
  const ApplyFilterWidget(this.controller, {Key? key}) : super(key: key);

  @override
  _ApplyFilterWidgetState createState() => _ApplyFilterWidgetState();
}

class _ApplyFilterWidgetState extends State<ApplyFilterWidget> {
  @override
  Widget build(BuildContext context) {
    // final devideInfo = MediaQuery.of(context);
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.maxFinite,
          height: 50,
          color: AppColors.primary,
          alignment: Alignment.topCenter,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Categoria"),
                        DropdownButton<String>(
                          items: widget.controller.categorys.map((cat) {
                            return DropdownMenuItem<String>(
                              value: cat.name,
                              child: Text(cat.name),
                            );
                          }).toList(),
                          onChanged: (String? newCategory) {
                            setState(() {
                              widget.controller.catcategorySelected =
                                  newCategory!;
                            });
                          },
                          value: widget.controller.catcategorySelected,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
