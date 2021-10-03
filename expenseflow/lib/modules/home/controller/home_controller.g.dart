// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  Computed<String>? _$catcategorySelectedComputed;

  @override
  String get catcategorySelected => (_$catcategorySelectedComputed ??=
          Computed<String>(() => super.catcategorySelected,
              name: 'HomeControllerBase.catcategorySelected'))
      .value;
  Computed<List<CategoryModel>>? _$categorysComputed;

  @override
  List<CategoryModel> get categorys => (_$categorysComputed ??=
          Computed<List<CategoryModel>>(() => super.categorys,
              name: 'HomeControllerBase.categorys'))
      .value;
  Computed<Either<Failure, List<ExpenseModel>>>? _$expensesComputed;

  @override
  Either<Failure, List<ExpenseModel>> get expenses => (_$expensesComputed ??=
          Computed<Either<Failure, List<ExpenseModel>>>(() => super.expenses,
              name: 'HomeControllerBase.expenses'))
      .value;

  final _$_expensesAtom = Atom(name: 'HomeControllerBase._expenses');

  @override
  ObservableList<ExpenseModel>? get _expenses {
    _$_expensesAtom.reportRead();
    return super._expenses;
  }

  @override
  set _expenses(ObservableList<ExpenseModel>? value) {
    _$_expensesAtom.reportWrite(value, super._expenses, () {
      super._expenses = value;
    });
  }

  final _$_categorysAtom = Atom(name: 'HomeControllerBase._categorys');

  @override
  List<CategoryModel> get _categorys {
    _$_categorysAtom.reportRead();
    return super._categorys;
  }

  @override
  set _categorys(List<CategoryModel> value) {
    _$_categorysAtom.reportWrite(value, super._categorys, () {
      super._categorys = value;
    });
  }

  final _$_categorySelectedAtom =
      Atom(name: 'HomeControllerBase._categorySelected');

  @override
  String get _categorySelected {
    _$_categorySelectedAtom.reportRead();
    return super._categorySelected;
  }

  @override
  set _categorySelected(String value) {
    _$_categorySelectedAtom.reportWrite(value, super._categorySelected, () {
      super._categorySelected = value;
    });
  }

  final _$initAppAsyncAction = AsyncAction('HomeControllerBase.initApp');

  @override
  Future<void> initApp() {
    return _$initAppAsyncAction.run(() => super.initApp());
  }

  final _$dellExpenseAsyncAction =
      AsyncAction('HomeControllerBase.dellExpense');

  @override
  Future<void> dellExpense(int id) {
    return _$dellExpenseAsyncAction.run(() => super.dellExpense(id));
  }

  final _$updateExpenseAsyncAction =
      AsyncAction('HomeControllerBase.updateExpense');

  @override
  Future<bool> updateExpense(ExpenseModel expense) {
    return _$updateExpenseAsyncAction.run(() => super.updateExpense(expense));
  }

  final _$initCategorysAsyncAction =
      AsyncAction('HomeControllerBase.initCategorys');

  @override
  Future<void> initCategorys() {
    return _$initCategorysAsyncAction.run(() => super.initCategorys());
  }

  @override
  String toString() {
    return '''
catcategorySelected: ${catcategorySelected},
categorys: ${categorys},
expenses: ${expenses}
    ''';
  }
}
