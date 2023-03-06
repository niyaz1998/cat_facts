part of 'cat_facts_bloc.dart';

abstract class CatFactsState {}

class CatFactsLoadingState extends CatFactsState {}

class CatFactsLoadedState extends CatFactsState {
  final List<CatFactEntity> catFacts;

  CatFactsLoadedState(this.catFacts);
}

class CatFactsErrorState extends CatFactsState {}
