import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:vitalvet_app/constants/constants.dart';

part 'window_size_event.dart';
part 'window_size_state.dart';

class WindowSizeBloc extends Bloc<WindowSizeEvent, WindowSizeState> {
  WindowSizeBloc() : super(WindowSizeInitial()) {
    on<ChangeWindowSizeEvent>((event, emit) {
      double width = MediaQuery.of(event.context).size.width;
      double height = MediaQuery.of(event.context).size.height;
      int screenSize = SMALL_SCREEN_SIZE;

      if (isSmallScreen(width)) {
        screenSize = SMALL_SCREEN_SIZE;
      } else if (isMediumScreen(width)) {
        screenSize = MEDIUM_SCREEN_SIZE;
      } else if (isLargeScreen(width)) {
        screenSize = LARGE_SCREEN_SIZE;
      }

      print('Cambiando Size: $width, $height, $screenSize');
      emit(WindowSize(width, height, screenSize));
    });
  }

  bool isSmallScreen(width) {
    return width < MEDIUM_BREAKPOINT;
  }

  bool isMediumScreen(width) {
    return width > MEDIUM_BREAKPOINT && width < LARGE_BREAKPOINT;
  }

  bool isLargeScreen(width) {
    return width > LARGE_BREAKPOINT;
  }

  bool isUltraLargeScreen(width) {
    return width > ULTRALARGE_BREAKPOINT;
  }
}
