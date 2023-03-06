import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.config.dart';

@InjectableInit()
void configureDependencies({required String environment}) =>
    GetIt.instance.init(environment: environment);
