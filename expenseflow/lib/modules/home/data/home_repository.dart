import 'package:expenseflow/core/app/connectivity_service.dart';
import 'package:expenseflow/core/config/drivers/device_storage_driver.dart';

class HomeRepository {
  HomeRepository(
    ConnectivityService connectivityService,
    DeviceStorageDriver deviceStorageDriver,
  );

  Future<void> getAllExpenses() async {}
}
