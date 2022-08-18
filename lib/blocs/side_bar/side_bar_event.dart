part of 'side_bar_bloc.dart';

abstract class SideBarEvent extends Equatable {
  const SideBarEvent();

  @override
  List<Object> get props => [];
}

class ChangeSideBarSelectionEvent extends SideBarEvent {
  final int newIndex;
  const ChangeSideBarSelectionEvent(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}
