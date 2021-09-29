import 'dart:convert';

import 'package:expenseflow/core/config/consts/app_consts.dart';
import 'package:hive/hive.dart';

abstract class DeviceStorageDriver {
  void saveObject(String key, Map<String, dynamic> object);

  Map<String, dynamic> getObject(String key);

  void saveString(String key, String value);

  dynamic get(String key);

  void delete(String key);

  bool containsKey(String key);
}

class HiveDriverImpl implements DeviceStorageDriver {
  HiveDriverImpl() {
    _initBox();
  }

  late final Box box;

  Future<void> _initBox() async {
    box = await Hive.openBox(AppConsts.hiveKey);
  }

  @override
  bool containsKey(String key) {
    return box.containsKey(key);
  }

  @override
  void delete(String key) async {
    await box.delete(key);
  }

  @override
  dynamic get(String key) {
    return box.get(key);
  }

  @override
  Map<String, dynamic> getObject(String key) {
    final object = box.get(key);
    if (object != null) {
      return jsonDecode(object as String) as Map<String, dynamic>;
    } else {
      return {};
    }
  }

  @override
  void saveObject(String key, Map<String, dynamic> object) {
    box.put(key, jsonEncode(object));
  }

  @override
  void saveString(String key, String value) {
    box.put(key, value);
  }
}
