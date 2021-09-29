import 'package:dartz/dartz.dart';
import 'package:expenseflow/core/app/connectivity_service.dart';
import 'package:expenseflow/core/config/drivers/device_storage_driver.dart';
import 'package:expenseflow/core/config/error/failures.dart';
import 'package:expenseflow/shared/Models/expense_model.dart';

class HomeRepository {
  DeviceStorageDriver deviceStorageDriver;
  HomeRepository(
    ConnectivityService connectivityService,
    this.deviceStorageDriver,
  );

  Future<Either<Failure, List<ExpenseModel>>> getAllExpenses(String key) async {
    try {
      final response = await deviceStorageDriver.get(key);
      final jsonResult = response.data;
      return Right([]);
    } catch (e) {
      return Left(ExpensesNotFoundFailure.instance);
    }
  }
}
