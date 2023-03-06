import 'package:cat_facts/features/cat_facts/domain/entities/cat_fact_entity.dart';
import 'package:cat_facts/features/cat_facts/domain/services/cat_facts_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_facts_state.dart';

part 'cat_facts_event.dart';

class CatFactsBloc extends Bloc<CatFactsEvent, CatFactsState> {
  static CatFactsBloc of(BuildContext context) => context.read();

  CatFactsBloc({
    required this.catFactsRepository,
  }) : super(CatFactsLoadingState()) {
    on<CatFactsLoadEvent>((event, emit) async {
      emit(CatFactsLoadingState());
      try {
        var catFacts = await catFactsRepository.fetchCatFacts();
        throw '';
        emit(CatFactsLoadedState(catFacts));
      } catch (e, s) {
        print(e);
        print(s);
        emit(CatFactsErrorState());
      }
    });
  }

  final CatFactsRepository catFactsRepository;
}
