import 'package:expenseflow/core/config/utils/app_module.dart';
import 'package:expenseflow/core/config/utils/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
