import 'dart:async';

import 'package:cat_facts/app/utils/consts.dart';
import 'package:cat_facts/features/authorization/domain/services/authorization_service.dart';
import 'package:cat_facts/features/email_authorization/presentation/modals/authorization_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Named(AppConsts.ios)
@Injectable(as: AuthorizationService, env: [Environment.prod])
class IosAuthorizationService extends FirebaseAuthorizationService {
  @FactoryMethod()
  IosAuthorizationService({
    @factoryParam required this.context,
  });

  /// context to show authorization dialog from
  final BuildContext context;

  @override
  Future<void> signIn() async {
    try {
      var authResult = await showEmailAuthorizationDialog(context: context);
      if (authResult != null) {
        await firebaseAuth.signInWithEmailAndPassword(
          email: authResult.email,
          password: authResult.password,
        );
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}
