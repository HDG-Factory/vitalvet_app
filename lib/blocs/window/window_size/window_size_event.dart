part of 'window_size_bloc.dart';

abstract class WindowSizeEvent extends Equatable {
  const WindowSizeEvent();

  @override
  List<Object> get props => [];
}

// class ChangeWindowSizeEvent extends WindowSizeEvent {
//   final int width, height;
//   const ChangeWindowSizeEvent(this.width, this.height);

//   @override
//   List<Object> get props => [width, height];
// }

class ChangeWindowSizeEvent extends WindowSizeEvent {
  final BuildContext context;

  const ChangeWindowSizeEvent(this.context);

  @override
  List<Object> get props => [context];
}
