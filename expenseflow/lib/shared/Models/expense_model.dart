import 'dart:convert';

import 'package:expenseflow/shared/Models/category_model.dart';

class ExpenseModel {
  String id;
  String name;
  String value;
  DateTime dueDate;
  String userId;
  List<CategoryModel>? cetegorys;
  ExpenseModel({
    required this.id,
    required this.name,
    required this.value,
    required this.dueDate,
    required this.userId,
    this.cetegorys,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'value': value,
      'dueDate': dueDate.millisecondsSinceEpoch,
      'userId': userId,
      'cetegorys': cetegorys?.map((x) => x.toMap()).toList() ?? [],
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'],
      name: map['name'],
      value: map['value'],
      dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate']),
      userId: map['userId'],
      cetegorys: List<CategoryModel>.from(
          map['cetegorys']?.map((x) => CategoryModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) =>
      ExpenseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExpenseModel(id: $id, name: $name, value: $value, dueDate: $dueDate, userId: $userId, cetegorys: $cetegorys)';
  }
}
