part of 'add_pet_bloc.dart';

abstract class AddPetEvent extends Equatable {
  const AddPetEvent();

  @override
  List<Object> get props => [];
}

class AddNewPetEvent extends AddPetEvent {
  final String? name;
  final String? weight;
  final String? birthday;
  final String? dateOfDeath;
  final String? mainPicture;
  final int? subspeciesId;
  final int? ownerId;
  // In case user want to create a new species or subspecies
  final int? speciesId;
  final String? newSpeciesName;
  final String? newSubspeciesName;

  const AddNewPetEvent(
      {this.name,
      this.weight,
      this.birthday,
      this.dateOfDeath,
      this.mainPicture,
      this.subspeciesId,
      this.ownerId,
      this.speciesId,
      this.newSpeciesName,
      this.newSubspeciesName});
}
