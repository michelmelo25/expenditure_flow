import 'package:expenseflow/core/config/consts/app_colors.dart';
import 'package:expenseflow/core/config/consts/app_styles.dart';
import 'package:expenseflow/modules/home/controller/home_controller.dart';
import 'package:expenseflow/shared/Widgets/input_text_widget.dart';
import 'package:flutter/material.dart';

class InsertExpensePage extends StatefulWidget {
  final HomeController controller;
  const InsertExpensePage(this.controller, {Key? key}) : super(key: key);

  @override
  _InsertExpensePageState createState() => _InsertExpensePageState();
}

class _InsertExpensePageState extends State<InsertExpensePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  bool paid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: buidBody(context),
    );
  }

  Widget buidBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Peencha os dados da despesa"),
          SizedBox(
            height: 24,
          ),
          Form(
            key: widget.controller.formKey,
            child: Column(children: [
              InputTextWidget(
                label: "Nome da despesa",
                controller: nameController,
                icon: Icons.description_outlined,
                onChanged: (value) {},
              ),
              InputTextWidget(
                controller: dueDateController,
                label: "Vencimento",
                icon: Icons.calendar_today_outlined,
                onChanged: (value) {},
              ),
              InputTextWidget(
                controller: valueController,
                label: "Valor",
                icon: Icons.attach_money_outlined,
                onChanged: (value) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Icon(Icons.payment_outlined,
                            color: AppColors.primary),
                      ),
                      Container(
                        width: 1,
                        height: 48,
                        color: AppColors.stroke,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Text("Pago?", style: AppStyles.input),
                      )
                    ],
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Checkbox(
                        value: paid,
                        onChanged: (status) {
                          setState(() {
                            paid = status!;
                          });
                        }),
                  ),
                ],
              ),
              // TextField(
              //   style: AppStyles.input,
              //   decoration: InputDecoration(
              //       contentPadding: EdgeInsets.zero,
              //       labelText: "Pago?",
              //       labelStyle: AppStyles.input,
              //       enabled: false,
              //       icon: Row(
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.symmetric(horizontal: 18),
              //             child: Icon(
              //               Icons.payment_outlined,
              //               color: AppColors.primary,
              //             ),
              //           ),
              //           Container(
              // width: 1,
              // height: 48,
              // color: AppColors.stroke,
              //           )
              //         ],
              //       ),
              //       border: InputBorder.none),
              // )
            ]),
          )
        ],
      ),
    );
  }
}
