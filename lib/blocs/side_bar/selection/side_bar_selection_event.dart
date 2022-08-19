part of 'side_bar_selection_bloc.dart';

abstract class SideBarSelectionEvent extends Equatable {
  const SideBarSelectionEvent();

  @override
  List<Object> get props => [];
}

class ChangeSideBarSelectionEvent extends SideBarSelectionEvent {
  final int newIndex;
  const ChangeSideBarSelectionEvent(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}
