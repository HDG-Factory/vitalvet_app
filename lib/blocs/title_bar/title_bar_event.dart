part of 'title_bar_bloc.dart';

abstract class TitleBarEvent extends Equatable {
  const TitleBarEvent();

  @override
  List<Object> get props => [];
}

class ChangeTitleBarEvent extends TitleBarEvent {
  final VoidCallback? onPressed;
  const ChangeTitleBarEvent({this.onPressed});
}
