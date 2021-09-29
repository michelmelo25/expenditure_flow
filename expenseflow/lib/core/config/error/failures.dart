import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class UserNotFoundFailure extends Failure {
  static const String MESSAGE = "Email ou senha incorretos";
  static UserNotFoundFailure instance = UserNotFoundFailure._();
  UserNotFoundFailure._() : super(MESSAGE);
}

class ExpensesNotFoundFailure extends Failure {
  static const String MESSAGE = "Contas não encontradas";
  static ExpensesNotFoundFailure instance = ExpensesNotFoundFailure._();
  ExpensesNotFoundFailure._() : super(MESSAGE);
}
