part of 'delete_owner_bloc.dart';

abstract class DeleteOwnerState extends Equatable {
  const DeleteOwnerState();

  @override
  List<Object> get props => [];
}

class DeleteOwnerInitial extends DeleteOwnerState {}

class DeleteOwnerError extends DeleteOwnerState {}

class DeletingOwner extends DeleteOwnerState {}

class OwnerDeleted extends DeleteOwnerState {}
