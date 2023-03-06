import 'package:cat_facts/features/cat_facts/data/api/cat_facts_api.dart';
import 'package:cat_facts/features/cat_facts/data/models/cat_fact_model.dart';
import 'package:cat_facts/features/cat_facts/domain/entities/cat_fact_entity.dart';
import 'package:cat_facts/features/cat_facts/domain/services/cat_facts_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CatFactsRepository)
class CatFactsRepositoryImpl extends CatFactsRepository {
  final CatFactsApi catFactsApi;

  CatFactsRepositoryImpl(this.catFactsApi);

  @override
  Future<List<CatFactEntity>> fetchCatFacts() => catFactsApi
      .fetchCatFacts()
      .then((catFactModels) => catFactModels.toEntity());
}
