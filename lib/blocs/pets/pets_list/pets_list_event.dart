part of 'pets_list_bloc.dart';

abstract class PetsListEvent extends Equatable {
  const PetsListEvent();

  @override
  List<Object> get props => [];
}

class LoadPetsListEvent extends PetsListEvent {}
