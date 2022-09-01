part of 'add_pet_bloc.dart';

abstract class AddPetState extends Equatable {
  const AddPetState();

  @override
  List<Object> get props => [];
}

class AddPetInitial extends AddPetState {}

class AddPetError extends AddPetState {}

class AddingPet extends AddPetState {}

class PetAdded extends AddPetState {}
