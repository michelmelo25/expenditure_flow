import 'package:dartz/dartz.dart';
import 'package:expenseflow/core/config/error/failures.dart';
import 'package:expenseflow/modules/home/data/home_repository.dart';
import 'package:expenseflow/shared/Models/expense_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final HomeRepository repository;
  HomeControllerBase(this.repository);

  // @observable
  // UserModel? _user;

  @observable
  ObservableList<ExpenseModel>? _expenses;

  @computed
  Either<Failure, List<ExpenseModel>> get expenses => (_expenses == null)
      ? Left(ExpensesNotFoundFailure.instance)
      : Right(_expenses!);

  @action
  Future<void> initApp() async {
    // _user = user;
    _expenses = ObservableList();
    final response = await repository.getAllExpenses();
    response.fold((error) => null, (expenses) => _expenses!.addAll(expenses));
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
}
