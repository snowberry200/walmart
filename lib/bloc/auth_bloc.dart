import 'package:bloc/bloc.dart';
import 'package:walmart/bloc/auth_event.dart';
import 'package:walmart/bloc/auth_state.dart';
import 'package:walmart/widget/database.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Database database;

  AuthBloc({required this.database}) : super(AuthInitial()) {
    on<SignInEvent>(_onSignInEvent);
    on<SignUpEvent>(_onSignUpEvent);
    on<EmailContinueEvent>(_onEmailContinueEvent);
    on<ChangeEvent>(_onChangeEvent);
  }
  Future<void> _onEmailContinueEvent(
      EmailContinueEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      emit(EmailContinueState(email: event.email));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onChangeEvent(
      ChangeEvent event, Emitter<AuthState> emit) async {
    emit(AuthInitial());
  }

  Future<void> _onSignInEvent(
      SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await database.getinfo(username: event.email, pass: event.password);
      emit(Authenticated(email: event.email));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onSignUpEvent(
      SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await database.signUp(
          name: event.name, username: event.email, pass: event.password);
      emit(SignedUpState(
          name: event.name, password: event.password, email: event.email));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
