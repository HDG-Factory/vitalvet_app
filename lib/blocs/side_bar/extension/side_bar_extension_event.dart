part of 'side_bar_extension_bloc.dart';

abstract class SideBarExtensionEvent extends Equatable {
  const SideBarExtensionEvent();

  @override
  List<Object> get props => [];
}

class ChangeSideBarExtensionEvent extends SideBarExtensionEvent {
  final bool newValue;
  const ChangeSideBarExtensionEvent(this.newValue);

  @override
  List<Object> get props => [newValue];
}
