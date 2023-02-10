part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}


class AuthError extends AuthState {
  final String? error;
  AuthError({this.error});
}
class AuthLoading extends AuthState {}

class AuthSucces extends AuthState {
  final StatusModel model;
  AuthSucces({required this.model});
}
