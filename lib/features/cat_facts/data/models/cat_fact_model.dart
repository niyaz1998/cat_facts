import 'package:cat_facts/features/cat_facts/domain/entities/cat_fact_entity.dart';

class CatFactModel {
  final String fact;
  final int length;

  CatFactModel({
    required this.fact,
    required this.length,
  });

  Map<String, dynamic> toMap() {
    return {
      'fact': fact,
      'length': length,
    };
  }

  factory CatFactModel.fromMap(Map<String, dynamic> map) {
    return CatFactModel(
      fact: map['fact'] as String,
      length: map['length'] as int,
    );
  }
}

extension CatFactToEntity on CatFactModel {
  CatFactEntity toEntity() => CatFactEntity(catFact: fact);
}

extension CatFactListToEntity on List<CatFactModel> {
  List<CatFactEntity> toEntity() => map((e) => e.toEntity()).toList();
}
