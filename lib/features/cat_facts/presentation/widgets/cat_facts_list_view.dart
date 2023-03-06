import 'package:cat_facts/app/widgets/cat_loader.dart';
import 'package:cat_facts/di/service_locator.dart';
import 'package:cat_facts/features/cat_facts/domain/services/cat_facts_repository.dart';
import 'package:cat_facts/features/cat_facts/domain/state/cat_facts_bloc.dart';
import 'package:cat_facts/features/cat_facts/presentation/widgets/cat_fact_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFactsListView extends StatelessWidget {
  const CatFactsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatFactsBloc(
        catFactsRepository: getIt<CatFactsRepository>(),
      )..add(CatFactsLoadEvent()),
      child: BlocBuilder<CatFactsBloc, CatFactsState>(
        builder: (context, state) {
          if (state is CatFactsLoadedState) {
            return ListView.separated(
              itemCount: state.catFacts.length,
              padding: const EdgeInsets.all(12),
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (_, index) => CatFactCard(
                catFact: state.catFacts[index],
              ),
            );
          } else if (state is CatFactsErrorState) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Error occurred',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => CatFactsBloc.of(context).add(
                      CatFactsLoadEvent(),
                    ),
                    child: const Text('reload'),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CatLoader());
        },
      ),
    );
  }
}
