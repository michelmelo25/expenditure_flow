import 'package:expenseflow/modules/home/page/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppRoutes {
  static const main = "/";

  static List<ModularRoute> setUp() {
    return [
      ChildRoute(AppRoutes.main, child: (_, args) => HomePage()),
    ];
  }
}
