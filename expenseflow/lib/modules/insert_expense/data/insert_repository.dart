import 'package:dartz/dartz.dart';
import 'package:expenseflow/core/config/error/failures.dart';
import 'package:expenseflow/core/config/provider/db_provider.dart';
import 'package:expenseflow/shared/Models/category_model.dart';
import 'package:expenseflow/shared/Models/expense_model.dart';

class InsertRepository {
  String expendeDB = "Expense";
  String categoreDB = "Category";

  Future<Either<Failure, int>> postExpense(ExpenseModel expense) async {
    try {
      final db = await DBProvider.db.database;
      var request = expense.toMap();
      request['paid'] = request['paid'] == true ? 1 : 0;
      var response = await db.insert(expendeDB, request);
      return Right(response);
    } catch (e) {
      return Left(ExpensesNotSaveFailure.instance);
    }
  }

  Future<Either<Failure, List<CategoryModel>>> getAllCategorys() async {
    try {
      final db = await DBProvider.db.database;
      var response = await db.query(categoreDB);
      return Right(List.from(
          response.map((category) => CategoryModel.fromMap(category))));
    } catch (e) {
      return Left(ExpensesNotFoundFailure.instance);
    }
  }

  Future<Either<Failure, int>> postCategory(CategoryModel category) async {
    try {
      final db = await DBProvider.db.database;
      var response = await db.insert(categoreDB, category.toMap());
      if (response >= 1) {
        return Right(response);
      }
      return Left(CategoryNotSaveFailure.instance);
    } catch (e) {
      return Left(CategoryNotSaveFailure.instance);
    }
  }
}
