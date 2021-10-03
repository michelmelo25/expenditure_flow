import 'package:dartz/dartz.dart';
import 'package:expenseflow/core/config/error/failures.dart';
import 'package:expenseflow/modules/home/data/home_repository.dart';
import 'package:expenseflow/shared/Models/category_model.dart';
import 'package:expenseflow/shared/Models/expense_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final HomeRepository repository;
  HomeControllerBase(this.repository);

  @observable
  ObservableList<ExpenseModel>? _expenses;

  @observable
  List<CategoryModel> _categorys = [];

  @observable
  String _categorySelected = "-";

  @observable
  String _dateSelected = "-";

  @observable
  String _nameSelected = "";

  @computed
  String get catcategorySelected => _categorySelected;

  @computed
  void set catcategorySelected(String text) => _categorySelected = text;

  @computed
  String get nameSelected => _nameSelected;

  @computed
  void set nameSelected(String text) => _nameSelected = text;

  @computed
  String get dateSelected => _dateSelected;

  @computed
  void set dateSelected(String text) => _dateSelected = text;

  @computed
  List<CategoryModel> get categorys => _categorys;

  @computed
  Either<Failure, List<ExpenseModel>> get expenses => (_expenses == null)
      ? Left(ExpensesNotFoundFailure.instance)
      : (_categorySelected == "-")
          ? (_nameSelected == "")
              ? (_dateSelected == "")
                  ? Right(_expenses!)
                  : Right(filterByMonth())
              : Right(filterByName())
          : Right(filterByCategory());

  List<ExpenseModel> filterByName() {
    return List.from(_expenses!.where((element) =>
        element.name == nameSelected ||
        element.name.toLowerCase() == nameSelected.toLowerCase()));
  }

  List<ExpenseModel> filterByCategory() {
    return [];
  }

  List<ExpenseModel> filterByMonth() {
    return List.from(
        _expenses!.where((element) => element.dueDate.contains(_dateSelected)));
  }

  @action
  Future<void> initApp() async {
    // _user = user;
    _expenses = ObservableList();
    final response = await repository.getAllExpenses();
    response.fold((error) => null, (expenses) => _expenses!.addAll(expenses));

    await initCategorys();
  }

  @action
  Future<void> dellExpense(int id) async {
    final response = await repository.dellExpense(id);
    response.fold((error) => null,
        (expenses) => _expenses!.removeWhere((element) => element.id == id));
  }

  @action
  Future<bool> updateExpense(ExpenseModel expense) async {
    final response = await repository.putExpense(expense);
    bool res = true;
    response.fold((error) => res = false,
        (value) => (value == 1) ? res = true : res = false);
    return res;
  }

  @action
  Future<void> initCategorys() async {
    try {
      final response = await repository.getAllCategorys();
      _categorys.clear();
      _categorys.add(CategoryModel(name: "-"));
      response.fold(
          (l) => null, (categoryList) => _categorys.addAll(categoryList));
    } catch (e) {}
  }
}
