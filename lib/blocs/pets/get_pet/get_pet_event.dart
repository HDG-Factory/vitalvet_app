part of 'get_pet_bloc.dart';

abstract class GetPetEvent extends Equatable {
  const GetPetEvent();

  @override
  List<Object> get props => [];
}

class LoadPetEvent extends GetPetEvent {
  final int? id;

  const LoadPetEvent({this.id});
}
