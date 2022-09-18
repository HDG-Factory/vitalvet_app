part of 'get_pet_bloc.dart';

abstract class GetPetState extends Equatable {
  const GetPetState();

  @override
  List<Object> get props => [];
}

class GetPetInitial extends GetPetState {}

class LoadPetError extends GetPetState {}

class LoadingPet extends GetPetState {}

class PetLoaded extends GetPetState {
  final dynamic pet;

  const PetLoaded({required this.pet});

  @override
  List<Object> get props => [pet];
}
