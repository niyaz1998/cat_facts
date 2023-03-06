import 'dart:async';

import 'package:cat_facts/features/authorization/domain/services/authorization_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthorizationService, env: [Environment.test])
class MockAuthorizationService extends AuthorizationService {
  final StreamController<bool> _authorizationStateController =
      StreamController.broadcast();

  @override
  Future<void> signIn() async {
    await Future.delayed(const Duration(seconds: 1));
    _authorizationStateController.add(true);
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 1));
    _authorizationStateController.add(false);
  }

  @override
  Stream<bool> get authorizeStateChange => _authorizationStateController.stream;
}
