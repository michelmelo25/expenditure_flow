import 'package:expenseflow/modules/home/page/home_page.dart';
import 'package:expenseflow/modules/insert_expense/pages/insert_expense_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppRoutes {
  static const main = "/";
  static const add = "/add";

  static List<ModularRoute> setUp() {
    return [
      ChildRoute(AppRoutes.main,
          child: (_, args) => HomePage(Modular.get(), user: args.data)),
      ChildRoute(AppRoutes.add,
          child: (_, args) =>
              InsertExpensePage(Modular.get(), expense: args.data)),
    ];
  }
}
