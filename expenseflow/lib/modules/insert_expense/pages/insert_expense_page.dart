import 'package:expenseflow/core/config/consts/app_colors.dart';
import 'package:expenseflow/core/config/consts/app_styles.dart';
import 'package:expenseflow/modules/insert_expense/controller/insert_expense_controller.dart';
import 'package:expenseflow/modules/insert_expense/widgets/button_navigation_widget.dart';
import 'package:expenseflow/shared/Models/expense_model.dart';
import 'package:expenseflow/shared/Widgets/input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InsertExpensePage extends StatefulWidget {
  final InsertExpenseController controller;
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
      bottomNavigationBar: ButtonNavigationWidget(
        onPressedPrimary: () async {
          await widget.controller.saveExpense(ExpenseModel(
            name: nameController.text,
            value: double.parse(valueController.text),
            dueDate: dueDateController.text,
            paid: paid,
          ));
          Modular.to.pop();
        },
        onPressedSecond: () {
          Modular.to.pop();
        },
      ),
    );
  }

  Widget buidBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Peencha os dados da despesa", style: AppStyles.trailingRegular),
          SizedBox(
            height: 30,
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
                keyboardType: TextInputType.datetime,
                onChanged: (value) {},
              ),
              InputTextWidget(
                controller: valueController,
                label: "Valor",
                icon: Icons.attach_money_outlined,
                keyboardType: TextInputType.number,
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
              Divider(
                thickness: 1,
                height: 1,
                color: AppColors.stroke,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
