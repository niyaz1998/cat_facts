import 'package:cat_facts/features/cat_facts/domain/entities/cat_fact_entity.dart';
import 'package:flutter/material.dart';

class CatFactCard extends StatelessWidget {
  const CatFactCard({
    Key? key,
    required this.catFact,
  }) : super(key: key);

  final CatFactEntity catFact;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          catFact.catFact,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
