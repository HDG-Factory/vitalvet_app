part of 'owners_list_bloc.dart';

abstract class OwnersListEvent extends Equatable {
  const OwnersListEvent();

  @override
  List<Object> get props => [];
}

class LoadOwnersListEvent extends OwnersListEvent {}
