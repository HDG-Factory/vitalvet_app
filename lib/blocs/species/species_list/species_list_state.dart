part of 'species_list_bloc.dart';

abstract class SpeciesListState extends Equatable {
  const SpeciesListState();

  @override
  List<Object> get props => [];
}

class SpeciesListInitial extends SpeciesListState {}

class LoadingSpeciesList extends SpeciesListState {}

class SpeciesListLoaded extends SpeciesListState {
  final List<dynamic> species;

  const SpeciesListLoaded({required this.species});

  @override
  List<Object> get props => [species];
}

class LoadingSubspeciesList extends SpeciesListState {}

class SubspeciesListLoaded extends SpeciesListState {
  final List<dynamic> subspecies;

  const SubspeciesListLoaded({required this.subspecies});

  @override
  List<Object> get props => [subspecies];
}
