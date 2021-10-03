import 'package:expenseflow/modules/home/controller/home_controller.dart';
import 'package:expenseflow/shared/Models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseListWodget extends StatefulWidget {
  final HomeController controller;
  final List<ExpenseModel> expenses;
  const ExpenseListWodget(this.controller, {required this.expenses, Key? key})
      : super(key: key);

  @override
  _ExpenseListWodgetState createState() => _ExpenseListWodgetState();
}

class _ExpenseListWodgetState extends State<ExpenseListWodget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: widget.expenses.length,
          itemBuilder: (_, index) {
            return Card(
                child: ListTile(
              title: Expanded(
                  child: RichText(
                      text: TextSpan(children: [
                TextSpan(text: "${widget.expenses[index].name}\n"),
                // TextSpan(text: "${widget.expenses[index].cetegory ?? ''}"),
              ]))),
              trailing: Checkbox(
                value: widget.expenses[index].paid,
                onChanged: (status) async {
                  widget.expenses[index].paid = status!;
                  await widget.controller.updateExpense(widget.expenses[index]);
                },
              ),
            ));
          }),
    );
  }
}
