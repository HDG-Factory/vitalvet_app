part of 'pets_list_bloc.dart';

abstract class PetsListState extends Equatable {
  const PetsListState();

  @override
  List<Object> get props => [];
}

class PetsListInitial extends PetsListState {}

class LoadingPetsList extends PetsListState {}

class PetsListLoaded extends PetsListState {
  final List<dynamic> pets;

  const PetsListLoaded({required this.pets});

  @override
  List<Object> get props => [pets];
}
