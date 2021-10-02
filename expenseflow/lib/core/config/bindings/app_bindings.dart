import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:expenseflow/core/app/connectivity_service.dart';
import 'package:expenseflow/core/config/drivers/device_storage_driver.dart';
import 'package:expenseflow/modules/home/controller/home_controller.dart';
import 'package:expenseflow/modules/home/data/home_repository.dart';
import 'package:expenseflow/modules/insert_expense/controller/insert_expense_controller.dart';
import 'package:expenseflow/modules/insert_expense/data/insert_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBindigs {
  static List<Bind<Object>> setUp() {
    return [
      ...bindRepositories(),
      ...bindStores(),
      Bind((i) => ConnectivityServiceImpl(Connectivity())),
      Bind((i) => HiveDriverImpl()),
    ];
  }

  static bindRepositories() {
    return [
      Bind((i) => HomeRepository(
          i.get<ConnectivityService>(), i.get<DeviceStorageDriver>())),
      Bind((i) => InsertRepository()),
    ];
  }

  static bindStores() {
    return [
      Bind((i) => HomeController(i.get<HomeRepository>())),
      Bind((i) => InsertExpenseController(i.get<InsertRepository>())),
    ];
  }
}
