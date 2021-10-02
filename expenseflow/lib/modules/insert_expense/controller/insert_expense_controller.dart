import 'package:expenseflow/modules/insert_expense/data/insert_repository.dart';
import 'package:expenseflow/shared/Models/category_model.dart';
import 'package:expenseflow/shared/Models/expense_model.dart';
import 'package:mobx/mobx.dart';

part 'insert_expense_controller.g.dart';

class InsertExpenseController = InsertExpenseControllerBase
    with _$InsertExpenseController;

abstract class InsertExpenseControllerBase with Store {
  final InsertRepository repository;

  InsertExpenseControllerBase(this.repository);

  @observable
  List<CategoryModel> _catregorys = [];

  @computed
  List<CategoryModel> get categorys => _catregorys;

  @action
  Future<void> initCategorys() async {
    try {
      final response = await repository.getAllCategorys();
      _catregorys.clear();
      response.fold(
          (l) => null, (categoryList) => _catregorys.addAll(categoryList));
    } catch (e) {}
  }

  @action
  Future<void> saveExpense(ExpenseModel expense) async {
    try {
      repository.postExpense(expense);
    } catch (e) {}
  }
}
