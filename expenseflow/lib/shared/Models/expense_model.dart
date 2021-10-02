import 'dart:convert';

class ExpenseModel {
  int? id;
  String name;
  double value;
  String dueDate;
  bool paid;
  // String userId;
  String? category;
  ExpenseModel({
    this.id,
    required this.name,
    required this.value,
    required this.dueDate,
    required this.paid,
    this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'value': value,
      'dueDate': dueDate,
      'paid': paid,
      'category': category,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'],
      name: map['name'],
      value: map['value'],
      dueDate: map['dueDate'],
      paid: map['paid'] == 1 ? true : false,
      category: map['category'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) =>
      ExpenseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExpenseModel(id: $id, name: $name, value: $value, dueDate: $dueDate, paid: $paid, category: $category)';
  }
}
