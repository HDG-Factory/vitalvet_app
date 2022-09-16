part of 'owners_list_bloc.dart';

abstract class OwnersListState extends Equatable {
  const OwnersListState();

  @override
  List<Object> get props => [];
}

class OwnersListInitial extends OwnersListState {}

class LoadingOwnersList extends OwnersListState {}

class OwnersListLoaded extends OwnersListState {
  final List<dynamic> owners;

  const OwnersListLoaded({required this.owners});

  @override
  List<Object> get props => [owners];
}
