import 'package:flutter_application_1/core/imports/imports.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class AuthCubitLoading extends AuthCubitState {}

class AuthUnauthenticated extends AuthCubitState {}

final class AuthCubitAuthenticated extends AuthCubitState {
  final User user;

  AuthCubitAuthenticated(this.user);
}

final class AuthCubitError extends AuthCubitState {
  final String message;

  AuthCubitError(this.message);
}
