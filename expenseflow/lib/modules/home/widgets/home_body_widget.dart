import 'package:expenseflow/core/config/consts/app_strings.dart';
import 'package:expenseflow/core/config/consts/app_styles.dart';
import 'package:expenseflow/modules/home/controller/home_controller.dart';
import 'package:expenseflow/modules/home/widgets/apply_filter_widget.dart';
import 'package:expenseflow/shared/Models/expense_model.dart';
import 'package:expenseflow/shared/Widgets/not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
              : expenceNotFound());
    });
  }

  Column expenceNotFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ApplyFilterWidget(widget.controller),
        Expanded(child: NotFoundWidget(title: AppStrings.expenseNotRegister)),
      ],
    );
  }

  Widget builBody(BuildContext context, List<ExpenseModel> expenses) {
    return Container(
      child: Column(
        children: [
          ApplyFilterWidget(widget.controller),
          Expanded(
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
                            onChanged: (status) async {
                              setState(() {
                                expenses[index].paid = status!;
                              });
                              await widget.controller
                                  .updateExpense(expenses[index]);
                            },
                          ),
                          onLongPress: () {
                            _showRemoveTaskDialog(expenses[index]);
                          },
                          onTap: () async {
                            final add = await Modular.to
                                .pushNamed("/add", arguments: expenses[index]);
                            if (add == true) {
                              await widget.controller.initApp();
                            }
                          },
                        ),
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  _showRemoveTaskDialog(ExpenseModel expense) {
    Widget cancelButton = TextButton(
        onPressed: () {
          Modular.to.pop();
        },
        child: const Text("Cancelar"));
    Widget okButton = TextButton(
        onPressed: () async {
          await widget.controller.dellExpense(expense.id!);
          Modular.to.pop();
        },
        child: const Text("Confirmar"));

    AlertDialog dialog = AlertDialog(
      title: Text('Remover "${expense.name}"?'),
      content: const Text("Deseja mesmo remover esta despesa?"),
      actions: [
        cancelButton,
        okButton,
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return dialog;
        });
  }
}
