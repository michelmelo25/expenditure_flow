import 'package:dartz/dartz.dart';
import 'package:expenseflow/core/app/connectivity_service.dart';
import 'package:expenseflow/core/config/drivers/device_storage_driver.dart';
import 'package:expenseflow/core/config/error/failures.dart';
import 'package:expenseflow/core/config/provider/db_provider.dart';
import 'package:expenseflow/shared/Models/expense_model.dart';

class HomeRepository {
  DeviceStorageDriver deviceStorageDriver;
  HomeRepository(
    ConnectivityService connectivityService,
    this.deviceStorageDriver,
  );

  String expendeDB = "Expense";
  String userDb = "User";
  String categoreDB = "Category";
  String categoreExpendeDB = "ExpenseCategore";

  Future<Either<Failure, List<ExpenseModel>>> getAllExpenses() async {
    try {
      final db = await DBProvider.db.database;
      final response = await db.query(expendeDB);
      final jsonResult = List<ExpenseModel>.from(response.isNotEmpty
          ? response.map((e) => ExpenseModel.fromMap(e)).toList()
          : []);
      return Right(jsonResult);
    } catch (e) {
      return Left(ExpensesNotFoundFailure.instance);
    }
  }

  Future<Either<Failure, ExpenseModel>> getExpense(int id) async {
    try {
      final db = await DBProvider.db.database;
      final response = await db.query(expendeDB, where: "id=$id");
      final jsonResult = ExpenseModel.fromMap(response[0]);
      return Right(jsonResult);
    } catch (e) {
      return Left(ExpensesNotFoundFailure.instance);
    }
  }

  Future<Either<Failure, bool>> dellExpense(int id) async {
    try {
      final db = await DBProvider.db.database;
      final response = await db.delete(expendeDB, where: "id=$id");
      if (response > 0) {
        return Right(true);
      }
      return Left(ExpensesNotFoundFailure.instance);
    } catch (e) {
      return Left(ExpensesNotFoundFailure.instance);
    }
  }

  Future<Either<Failure, int>> postExpense(ExpenseModel expense) async {
    try {
      final db = await DBProvider.db.database;
      var response = await db.insert(expendeDB, expense.toMap());
      return Right(response);
    } catch (e) {
      return Left(ExpensesNotSaveFailure.instance);
    }
  }

  Future<Either<Failure, int>> putExpense(ExpenseModel expense) async {
    try {
      final db = await DBProvider.db.database;
      var request = expense.toMap();
      request['paid'] = request['paid'] == true ? 1 : 0;
      var response = await db
          .update(expendeDB, request, where: "id=?", whereArgs: [expense.id]);
      return Right(response);
    } catch (e) {
      return Left(ExpensesNotSaveFailure.instance);
    }
  }
}
