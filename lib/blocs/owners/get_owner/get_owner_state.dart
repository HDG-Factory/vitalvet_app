part of 'get_owner_bloc.dart';

abstract class GetOwnerState extends Equatable {
  const GetOwnerState();

  @override
  List<Object> get props => [];
}

class GetOwnerInitial extends GetOwnerState {}

class LoadingOwner extends GetOwnerState {}

class OwnerLoaded extends GetOwnerState {
  final dynamic owner;

  const OwnerLoaded({required this.owner});

  @override
  List<Object> get props => [owner];
}
