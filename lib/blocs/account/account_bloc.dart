import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vitalvet_app/services/api.dart';
import 'package:vitalvet_app/services/user_api.service.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<RegisterAccountEvent>((event, emit) async {
      final email = event.email;
      final password = event.password;

      final userData = {
        'email': email,
        'password': password,
      };

      emit(RegisteringAccount());
      await UserApiService().registerUser(userData).then((response) {
        if (response.statusCode == 201) {
          Api.accessToken = response.data['accessToken'];
          emit(AccountRegistered());
        } else {
          switch (response.data['message']) {
            case 'User already exists with this email':
              emit(const RegisterAccountError(
                  error: 'Ya existe otra cuenta de usuario para este correo'));
              break;
            case 'Email must be valid':
              emit(const RegisterAccountError(
                  error: 'El correo ingresado no es válido'));
              break;
            case 'Password must be at least 6 characters':
              emit(const RegisterAccountError(
                  error:
                      'La contraseña ingresada tiene menos de 6 caracteres'));
              break;
            default:
              emit(const RegisterAccountError(error: 'Error inesperado'));
              break;
          }
        }
        print(response);
      });
    });

    on<LoginAccountEvent>((event, emit) async {
      final email = event.email;
      final password = event.password;

      final userData = {
        'email': email,
        'password': password,
      };

      emit(LoggingAccount());
      await UserApiService().loginUser(userData).then((response) {
        if (response.statusCode == 200) {
          Api.accessToken = response.data['accessToken'];
          emit(AccountLogged());
        } else {
          switch (response.data['message']) {
            case 'Invalid email or password':
              emit(const RegisterAccountError(
                  error: 'Correo o contraseña inválido'));
              break;
            default:
              emit(const RegisterAccountError(error: 'Error inesperado'));
              break;
          }
        }
        print(response);
      });
    });
  }
}
