import 'package:cat_facts/app/app_runner.dart';

void main() async {
  var runner = CatFactsAppRunner();
  await runner.initialize();
  runner.run();
}
