import 'package:dartz/dartz.dart';
import 'package:expenseflow/core/config/error/failures.dart';
import 'package:expenseflow/core/config/provider/db_provider.dart';
import 'package:expenseflow/shared/Models/expense_model.dart';

class InsertRepository {
  String expendeDB = "Expense";

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
}
