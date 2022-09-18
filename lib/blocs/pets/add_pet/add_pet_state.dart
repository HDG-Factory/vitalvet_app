part of 'add_pet_bloc.dart';

abstract class AddPetState extends Equatable {
  const AddPetState();

  @override
  List<Object> get props => [];
}

class AddPetInitial extends AddPetState {}

class AddPetError extends AddPetState {
  final String? error;

  const AddPetError({this.error});
}

class AddingPet extends AddPetState {}

class PetAdded extends AddPetState {}
