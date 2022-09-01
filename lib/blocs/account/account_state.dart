part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {}

class RegisterAccountError extends AccountState {
  final String error;

  const RegisterAccountError({required this.error});

  @override
  List<Object> get props => [error];
}

class RegisteringAccount extends AccountState {}

class AccountRegistered extends AccountState {}

class LoginAccountError extends AccountState {}

class LoggingAccount extends AccountState {}

class AccountLogged extends AccountState {}
