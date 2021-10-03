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

  @observable
  ExpenseModel? _expenseSelected;

  @computed
  List<CategoryModel> get categorys => _catregorys;

  @computed
  ExpenseModel? get expense => _expenseSelected!;

  @action
  Future<void> initCategorys(ExpenseModel? expense) async {
    try {
      _expenseSelected = expense;
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

  @action
  Future<void> addCategory(CategoryModel category) async {
    try {
      final response = await repository.postCategory(category);
      response.fold((l) => null, (r) {
        category.id = r;
        _catregorys.add(category);
      });
    } catch (e) {}
  }

  @action
  Future<void> editExpense(ExpenseModel expense) async {
    try {
      final response = await repository.putExpense(expense);
      response.fold((l) => null, (r) => null);
    } catch (e) {}
  }
}
