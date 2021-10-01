import 'dart:convert';

import 'package:expenseflow/shared/Models/category_model.dart';

class ExpenseModel {
  int id;
  String name;
  String value;
  String dueDate;
  bool paid;
  // String userId;
  CategoryModel? cetegory;
  ExpenseModel({
    required this.id,
    required this.name,
    required this.value,
    required this.dueDate,
    required this.paid,
    this.cetegory,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'value': value,
      'dueDate': dueDate,
      'paid': paid,
      'cetegory': cetegory?.toMap(),
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'],
      name: map['name'],
      value: map['value'],
      dueDate: map['dueDate'],
      paid: map['paid'],
      cetegory: CategoryModel.fromMap(map['cetegory']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) =>
      ExpenseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExpenseModel(id: $id, name: $name, value: $value, dueDate: $dueDate, paid: $paid, cetegory: $cetegory)';
  }
}
