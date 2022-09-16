part of 'add_owner_bloc.dart';

abstract class AddOwnerState extends Equatable {
  const AddOwnerState();

  @override
  List<Object> get props => [];
}

class AddOwnerInitial extends AddOwnerState {}

class AddOwnerError extends AddOwnerState {}

class AddingOwner extends AddOwnerState {}

class OwnerAdded extends AddOwnerState {}
