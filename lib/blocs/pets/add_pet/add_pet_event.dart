part of 'add_pet_bloc.dart';

abstract class AddPetEvent extends Equatable {
  const AddPetEvent();

  @override
  List<Object> get props => [];
}

class AddNewPetEvent extends AddPetEvent {}
