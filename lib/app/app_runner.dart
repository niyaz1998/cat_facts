import 'package:cat_facts/app/app_builder.dart';
import 'package:cat_facts/di/injectable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

class CatFactsAppRunner {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    configureDependencies(environment: Environment.prod);
  }

  void run() => runApp(const CatFactsAppBuilder());
}
