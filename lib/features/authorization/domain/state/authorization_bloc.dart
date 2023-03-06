import 'package:cat_facts/features/authorization/domain/services/authorization_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authorization_state.dart';

part 'authorization_event.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  static AuthorizationBloc of(BuildContext context) => context.read();

  AuthorizationBloc({
    required this.authorizationService,
  }) : super(NotAuthorizedState()) {
    on<AuthorizationInitEvent>(
      (event, emit) => emit.forEach(
        authorizationService.authorizeStateChange,
        onData: (authorized) =>
            authorized ? AuthorizedState() : NotAuthorizedState(),
      ),
    );

    on<AuthorizationSignInEvent>(
      (event, emit) => authorizationService.signIn(),
    );

    on<AuthorizationSignOutEvent>(
      (event, emit) => authorizationService.signOut(),
    );
  }

  final AuthorizationService authorizationService;
}
