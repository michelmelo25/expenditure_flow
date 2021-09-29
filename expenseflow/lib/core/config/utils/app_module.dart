import 'package:expenseflow/core/config/bindings/app_bindings.dart';
import 'package:expenseflow/core/config/routes/app_routs.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [...AppBindigs.setUp()];

  @override
  final List<ModularRoute> routes = AppRoutes.setUp();
}
