part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class RegisterAccountEvent extends AccountEvent {
  final String email;
  final String password;
  const RegisterAccountEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginAccountEvent extends AccountEvent {
  final String email;
  final String password;
  const LoginAccountEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
