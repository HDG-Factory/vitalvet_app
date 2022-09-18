part of 'edit_pet_bloc.dart';

abstract class EditPetState extends Equatable {
  const EditPetState();

  @override
  List<Object> get props => [];
}

class EditPetInitial extends EditPetState {}

class EditPetError extends EditPetState {}

class EditingPet extends EditPetState {}

class PetEdited extends EditPetState {}
