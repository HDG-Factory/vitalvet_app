part of 'side_bar_bloc.dart';

abstract class SideBarState extends Equatable {
  const SideBarState();

  @override
  List<Object> get props => [];
}

class SideBarInitial extends SideBarState {}

class SideBarSelection extends SideBarState {
  final int index;

  const SideBarSelection(this.index);

  @override
  List<Object> get props => [index];
}
