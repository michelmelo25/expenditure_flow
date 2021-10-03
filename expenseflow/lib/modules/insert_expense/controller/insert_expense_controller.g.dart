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
  Computed<ExpenseModel?>? _$expenseComputed;

  @override
  ExpenseModel? get expense =>
      (_$expenseComputed ??= Computed<ExpenseModel?>(() => super.expense,
              name: 'InsertExpenseControllerBase.expense'))
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

  final _$_expenseSelectedAtom =
      Atom(name: 'InsertExpenseControllerBase._expenseSelected');

  @override
  ExpenseModel? get _expenseSelected {
    _$_expenseSelectedAtom.reportRead();
    return super._expenseSelected;
  }

  @override
  set _expenseSelected(ExpenseModel? value) {
    _$_expenseSelectedAtom.reportWrite(value, super._expenseSelected, () {
      super._expenseSelected = value;
    });
  }

  final _$initCategorysAsyncAction =
      AsyncAction('InsertExpenseControllerBase.initCategorys');

  @override
  Future<void> initCategorys(ExpenseModel? expense) {
    return _$initCategorysAsyncAction.run(() => super.initCategorys(expense));
  }

  final _$saveExpenseAsyncAction =
      AsyncAction('InsertExpenseControllerBase.saveExpense');

  @override
  Future<void> saveExpense(ExpenseModel expense) {
    return _$saveExpenseAsyncAction.run(() => super.saveExpense(expense));
  }

  final _$addCategoryAsyncAction =
      AsyncAction('InsertExpenseControllerBase.addCategory');

  @override
  Future<void> addCategory(CategoryModel category) {
    return _$addCategoryAsyncAction.run(() => super.addCategory(category));
  }

  final _$editExpenseAsyncAction =
      AsyncAction('InsertExpenseControllerBase.editExpense');

  @override
  Future<void> editExpense(ExpenseModel expense) {
    return _$editExpenseAsyncAction.run(() => super.editExpense(expense));
  }

  @override
  String toString() {
    return '''
categorys: ${categorys},
expense: ${expense}
    ''';
  }
}
