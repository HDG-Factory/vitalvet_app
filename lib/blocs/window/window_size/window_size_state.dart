part of 'window_size_bloc.dart';

abstract class WindowSizeState extends Equatable {
  const WindowSizeState();

  @override
  List<Object> get props => [];
}

class WindowSizeInitial extends WindowSizeState {}

class WindowSize extends WindowSizeState {
  final double width, height;
  final int screenSize;

  const WindowSize(this.width, this.height, this.screenSize);

  @override
  List<Object> get props => [width, height, screenSize];
}
