part of 'authorization_bloc.dart';

abstract class AuthorizationState {}

class NotAuthorizedState extends AuthorizationState {}

class AuthorizedState extends AuthorizationState {}
