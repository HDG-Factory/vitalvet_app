part of 'species_list_bloc.dart';

abstract class SpeciesListEvent extends Equatable {
  const SpeciesListEvent();

  @override
  List<Object> get props => [];
}

class LoadSpeciesListEvent extends SpeciesListEvent {}

class LoadSubspeciesListEvent extends SpeciesListEvent {
  final int speciesId;

  const LoadSubspeciesListEvent({required this.speciesId});

  @override
  List<Object> get props => [speciesId];
}
