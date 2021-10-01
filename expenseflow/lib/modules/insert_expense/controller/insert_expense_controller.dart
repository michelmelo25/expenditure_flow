import 'package:expenseflow/modules/insert_expense/data/insert_repository.dart';
import 'package:expenseflow/shared/Models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'insert_expense_controller.g.dart';

class InsertExpenseController = InsertExpenseControllerBase
    with _$InsertExpenseController;

abstract class InsertExpenseControllerBase with Store {
  final InsertRepository repository;

  InsertExpenseControllerBase(this.repository);

  final formKey = GlobalKey<FormState>();

  @action
  Future<void> saveExpense(ExpenseModel expense) async {
    try {
      repository.postExpense(expense);
    } catch (e) {}
  }
}
