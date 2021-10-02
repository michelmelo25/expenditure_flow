import 'package:expenseflow/core/config/consts/app_strings.dart';
import 'package:expenseflow/core/config/consts/app_styles.dart';
import 'package:expenseflow/modules/home/controller/home_controller.dart';
import 'package:expenseflow/shared/Models/expense_model.dart';
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
          (expenses) => (expenses.isNotEmpty)
              ? builBody(context, expenses)
              : NotFoundWidget(title: AppStrings.expenseNotRegister));
    });
  }

  Widget builBody(BuildContext context, List<ExpenseModel> expenses) =>
      Observer(builder: (_) {
        return Container(
          child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Card(
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${expenses[index].name}",
                              style: AppStyles.titleListTile,
                            ),
                            Text(
                              "R\$: ${expenses[index].value}",
                              style: AppStyles.trailingBold,
                            ),
                          ],
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${expenses[index].category}",
                                style: AppStyles.captionBody),
                            Text("${expenses[index].dueDate}",
                                style: AppStyles.captionBody),
                          ],
                        ),
                        trailing: Checkbox(
                          value: expenses[index].paid,
                          onChanged: (status) {
                            setState(() {
                              expenses[index].paid = status!;
                            });
                            widget.controller.updateExpense(expenses[index]);
                          },
                        ),
                      ),
                    )
                  ],
                );
              }),
        );
      });
}
