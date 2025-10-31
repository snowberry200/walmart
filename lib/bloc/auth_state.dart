import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  bool get isLoading => false;
  bool get isSignedIn => true;

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  const AuthLoading();
  @override
  List<Object?> get props => [];
  @override
  bool get isLoading => false;
}

class EmailContinueState extends AuthState {
  final String email;

  const EmailContinueState({required this.email});

  @override
  List<Object?> get props => [email];
}

class Authenticated extends AuthState {
  final String email;
  @override
  bool get isSignedIn => true;

  const Authenticated({required this.email});

  @override
  List<Object?> get props => [email];
}

class SignedUpState extends AuthState {
  final String? name;
  final String email;
  final dynamic password;

  const SignedUpState(
      {required this.name, required this.password, required this.email});

  @override
  List<Object?> get props => [email, name, password];
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}
