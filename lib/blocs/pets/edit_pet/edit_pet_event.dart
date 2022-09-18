part of 'edit_pet_bloc.dart';

abstract class EditPetEvent extends Equatable {
  const EditPetEvent();

  @override
  List<Object> get props => [];
}

class EditCreatedPetEvent extends EditPetEvent {
  final int? id;
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

  const EditCreatedPetEvent(
      {this.id,
      this.name,
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
