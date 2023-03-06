import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DioContainer {
  late Dio dio;

  @factoryMethod
  DioContainer() {
    final options = BaseOptions(
      baseUrl: 'https://catfact.ninja',
      connectTimeout: const Duration(seconds: 15000),
      receiveTimeout: const Duration(seconds: 15000),
    );
    dio = Dio(options);
  }
}
