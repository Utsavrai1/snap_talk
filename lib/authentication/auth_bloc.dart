import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_talk/authentication/auth_service.dart';
import 'package:snap_talk/storage/local_storage.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialState()) {
    on<AuthEvent>((event, emit) async {
      if (event is AttemptingLoginEvent) {
        emit(LoggingInState());

        try {
          final response =
              await AuthService().login(event.username, event.password);
          if (response['status_code'] == 201) {
            await LocalStorageService()
                .setDataToStorage('db_token', response['token']);

            await LocalStorageService().setDataToStorage('id', response['_id']);

            emit(LoginSuccessState());
          } else {
            emit(LoginFailState(response['error']));
          }
        } catch (e) {
          emit(LoginFailState('$e'));
        }
      } else if (event is AttemptingSignUpEvent) {
        emit(SignUpState());

        try {
          final response = await AuthService().signUp(
            event.name,
            event.username,
            event.password,
            event.confirmPassword,
            event.gender,
          );
          if (response['status_code'] == 201) {
            await LocalStorageService()
                .setDataToStorage('db_token', response['token']);

            await LocalStorageService().setDataToStorage('id', response['_id']);

            emit(SignUpSuccessState());
          } else {
            emit(SignUpFailState(response['error']));
          }
        } catch (e) {
          emit(SignUpFailState('$e'));
        }
      }
    });
  }
}

abstract class AuthEvent {}

abstract class AuthState {}

class AttemptingLoginEvent extends AuthEvent {
  String username;
  String password;

  AttemptingLoginEvent({required this.username, required this.password});
}

class InitialState extends AuthState {}

class LoggingInState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginFailState extends AuthState {
  String error;

  LoginFailState(this.error);
}

class AttemptingSignUpEvent extends AuthEvent {
  String name;
  String username;
  String password;
  String confirmPassword;
  String gender;

  AttemptingSignUpEvent({
    required this.name,
    required this.username,
    required this.password,
    required this.confirmPassword,
    required this.gender,
  });
}

class SignUpState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpFailState extends AuthState {
  String error;
  SignUpFailState(this.error);
}
