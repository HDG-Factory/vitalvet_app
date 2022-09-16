part of 'edit_owner_bloc.dart';

abstract class EditOwnerState extends Equatable {
  const EditOwnerState();

  @override
  List<Object> get props => [];
}

class EditOwnerInitial extends EditOwnerState {}

class EditOwnerError extends EditOwnerState {}

class EditingOwner extends EditOwnerState {}

class OwnerEdited extends EditOwnerState {}
