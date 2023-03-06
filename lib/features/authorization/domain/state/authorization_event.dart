part of 'authorization_bloc.dart';

abstract class AuthorizationEvent {}

class AuthorizationInitEvent extends AuthorizationEvent {}

class AuthorizationSignInEvent extends AuthorizationEvent {}

class AuthorizationSignOutEvent extends AuthorizationEvent {}
