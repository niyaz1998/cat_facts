import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class AuthorizationService {
  Future<void> signIn();

  Future<void> signOut();

  Stream<bool> get authorizeStateChange;
}

abstract class FirebaseAuthorizationService extends AuthorizationService {
  @protected
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signOut() => firebaseAuth.signOut();

  @override
  Stream<bool> get authorizeStateChange => firebaseAuth.authStateChanges().map(
        (user) => user != null,
      );
}
