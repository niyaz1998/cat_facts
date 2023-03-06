import 'dart:io';

import 'package:cat_facts/app/utils/consts.dart';
import 'package:cat_facts/di/service_locator.dart';
import 'package:cat_facts/features/authorization/domain/services/authorization_service.dart';
import 'package:cat_facts/features/authorization/domain/state/authorization_bloc.dart';
import 'package:cat_facts/features/authorization/presentation/pages/authorization_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatFactsAppBuilder extends StatelessWidget {
  const CatFactsAppBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat facts',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Provider(
        create: (context) => AuthorizationBloc(
          authorizationService: Platform.isIOS
              ? getIt<AuthorizationService>(
                  instanceName: AppConsts.ios,
                  param1: context,
                )
              : getIt<AuthorizationService>(
                  instanceName: AppConsts.android,
                ),
        )..add(AuthorizationInitEvent()),
        child: const AuthorizationPage(),
      ),
    );
  }
}
