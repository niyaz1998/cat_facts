import 'package:cat_facts/app/network/dio_container.dart';
import 'package:cat_facts/features/cat_facts/data/models/cat_fact_model.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CatFactsApi {
  final DioContainer dioContainer;

  CatFactsApi(this.dioContainer);

  /// API provides pagination, but it's not used for simplicity
  Future<List<CatFactModel>> fetchCatFacts() {
    return dioContainer.dio.request(
      '/facts',
      queryParameters: {'limit': 100},
    ).then((response) => (response.data['data'] as List)
        .map((json) => CatFactModel.fromMap(json))
        .toList());
  }
}
