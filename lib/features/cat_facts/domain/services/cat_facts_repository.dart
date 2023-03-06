import 'package:cat_facts/features/cat_facts/domain/entities/cat_fact_entity.dart';

abstract class CatFactsRepository {
  Future<List<CatFactEntity>> fetchCatFacts();
}