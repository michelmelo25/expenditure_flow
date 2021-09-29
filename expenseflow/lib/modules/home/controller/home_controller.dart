import 'package:dartz/dartz.dart';
import 'package:expenseflow/core/config/error/failures.dart';
import 'package:expenseflow/modules/home/data/home_repository.dart';
import 'package:expenseflow/shared/Models/expense_model.dart';
import 'package:expenseflow/shared/Models/user_model.dart';
import 'package:mobx/mobx.dart';

class HomeController {
  final HomeRepository repository;
  HomeController(this.repository);

  @observable
  UserModel? _user;

  @observable
  ObservableList<ExpenseModel>? _expenses;

  @computed
  Either<Failure, List<ExpenseModel>> get expenses => (_expenses == null)
      ? Left(ExpensesNotFoundFailure.instance)
      : Right(_expenses!);

  @action
  Future<void> initApp(UserModel user) async {
    _user = user;
    _expenses = ObservableList();
    final response = await repository.getAllExpenses(user.id);
    response.fold((error) => null, (expenses) => _expenses!.addAll(expenses));
  }
}
