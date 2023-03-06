import 'package:cat_facts/di/injectable.dart';
import 'package:cat_facts/di/service_locator.dart';
import 'package:cat_facts/features/authorization/domain/state/authorization_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;

void main() {
  test('Basic authorization logic test', () async {
    configureDependencies(environment: injectable.Environment.test);
    var authorizationBloc = AuthorizationBloc(authorizationService: getIt());
    authorizationBloc.add(AuthorizationInitEvent());
    await waitDelay();
    expect(true, authorizationBloc.state is NotAuthorizedState);
    authorizationBloc.add(AuthorizationSignInEvent());
    await waitDelay();
    expect(true, authorizationBloc.state is AuthorizedState);
    authorizationBloc.add(AuthorizationSignOutEvent());
    await waitDelay();
    expect(true, authorizationBloc.state is NotAuthorizedState);
  });
}

Future<void> waitDelay() => Future.delayed(const Duration(seconds: 2));
