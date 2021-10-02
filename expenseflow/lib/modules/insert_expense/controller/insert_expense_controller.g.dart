// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_expense_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InsertExpenseController on InsertExpenseControllerBase, Store {
  Computed<List<CategoryModel>>? _$categorysComputed;

  @override
  List<CategoryModel> get categorys => (_$categorysComputed ??=
          Computed<List<CategoryModel>>(() => super.categorys,
              name: 'InsertExpenseControllerBase.categorys'))
      .value;

  final _$_catregorysAtom =
      Atom(name: 'InsertExpenseControllerBase._catregorys');

  @override
  List<CategoryModel> get _catregorys {
    _$_catregorysAtom.reportRead();
    return super._catregorys;
  }

  @override
  set _catregorys(List<CategoryModel> value) {
    _$_catregorysAtom.reportWrite(value, super._catregorys, () {
      super._catregorys = value;
    });
  }

  final _$initCategorysAsyncAction =
      AsyncAction('InsertExpenseControllerBase.initCategorys');

  @override
  Future<void> initCategorys() {
    return _$initCategorysAsyncAction.run(() => super.initCategorys());
  }

  final _$saveExpenseAsyncAction =
      AsyncAction('InsertExpenseControllerBase.saveExpense');

  @override
  Future<void> saveExpense(ExpenseModel expense) {
    return _$saveExpenseAsyncAction.run(() => super.saveExpense(expense));
  }

  @override
  String toString() {
    return '''
categorys: ${categorys}
    ''';
  }
}
